#!/usr/bin/env bash
# Hook SessionStart du plugin amoa-transformation.
#
# Injecte le contexte de la mission dans le contexte du modele des le demarrage
# de la session, sans dependre de sa bonne volonte a lire CLAUDE.md.
#
# Silencieux (sortie vide, code 0) hors d'un espace de mission : le plugin est
# aussi actif dans des depots qui n'en sont pas un.
#
# Bash pur : ni node, ni jq, ni python ne sont supposes presents.

set -uo pipefail

# --- Localisation de l'espace de mission -----------------------------------
# Remonte l'arborescence a la recherche de 00-contexte/contexte-mission.md.

racine=""
courant="${CLAUDE_PROJECT_DIR:-$PWD}"
for _ in 1 2 3 4 5 6; do
  [ -z "$courant" ] && break
  if [ -f "$courant/00-contexte/contexte-mission.md" ]; then
    racine="$courant"
    break
  fi
  parent="$(dirname "$courant")"
  [ "$parent" = "$courant" ] && break
  courant="$parent"
done

[ -z "$racine" ] && exit 0

fichier_contexte="$racine/00-contexte/contexte-mission.md"

# --- Outils ----------------------------------------------------------------

# Echappe stdin pour l'inserer dans un litteral JSON.
# En sed/awk plutot qu'en substitution de parametre bash, dont le traitement
# des antislashs entre guillemets est trop fragile pour cet usage.
echapper_json() {
  sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/\r//g' -e 's/\t/\\t/g' \
    | awk 'BEGIN { ORS = "" } { if (NR > 1) printf "\\n"; print }'
}

# Affiche un fichier en supprimant les CR, ou rien s'il est absent.
lire() {
  [ -f "$1" ] || return 0
  tr -d '\r' < "$1"
}

# --- Numerotation en cours -------------------------------------------------
# Balaie tout le depot pour trouver le dernier identifiant attribue par prefixe,
# archives comprises : un identifiant abandonne ne doit jamais etre reattribue.

prefixes="BES:2 EF:3 ENF:3 RG:3 CT:3 RIS:2 DEC:2 ACT:2 QO:2"

tous_identifiants="$(
  grep -rhoE '\b(BES|EF|ENF|RG|CT|RIS|DEC|ACT|QO)-[0-9]+' \
    --include='*.md' --include='*.csv' --include='*.txt' \
    "$racine" 2>/dev/null | tr -d '\r'
)"

table_numerotation=""
for entree in $prefixes; do
  prefixe="${entree%%:*}"
  largeur="${entree##*:}"
  dernier="$(
    printf '%s\n' "$tous_identifiants" \
      | sed -n "s/^${prefixe}-0*\([0-9][0-9]*\)\$/\1/p" \
      | sort -n | tail -1
  )"
  [ -z "$dernier" ] && dernier=0
  suivant=$((dernier + 1))
  if [ "$dernier" -eq 0 ]; then
    affiche_dernier="aucun"
  else
    affiche_dernier="$(printf "%s-%0${largeur}d" "$prefixe" "$dernier")"
  fi
  affiche_suivant="$(printf "%s-%0${largeur}d" "$prefixe" "$suivant")"
  table_numerotation="${table_numerotation}| \`${prefixe}\` | ${affiche_dernier} | **${affiche_suivant}** |"$'\n'
done

# --- Etat de remplissage du contexte ---------------------------------------
# Les lignes de consigne (commencant par >) ne sont pas des champs a remplir.

champs_a_remplir="$(
  awk '
    # Suit la rubrique courante, pour rattacher les champs hors tableau.
    /^##+[ \t]/ {
      section = $0
      sub(/^#+[ \t]*/, "", section)
      sousrubrique = ""
    }
    /^\*\*.+\*\*[ \t]*$/ {
      sousrubrique = $0
      gsub(/\*/, "", sousrubrique)
      gsub(/^[ \t]+/, "", sousrubrique)
      gsub(/[ \t]+$/, "", sousrubrique)
    }
    /À REMPLIR/ {
      ligne = $0
      sub(/^[ \t]+/, "", ligne)
      if (ligne ~ /^>/) next
      if (ligne ~ /^\|/) {
        split(ligne, cols, "|")
        libelle = cols[2]
      } else {
        libelle = ligne
        sub(/^[-*][ \t]*/, "", libelle)
        sub(/^[0-9]+\.[ \t]*/, "", libelle)
        sub(/À REMPLIR.*$/, "", libelle)
      }
      gsub(/^[ \t]+/, "", libelle)
      gsub(/[ \t]+$/, "", libelle)
      # Un champ sans libelle propre est designe par sa rubrique.
      if (libelle == "" || libelle == "À REMPLIR") {
        if (sousrubrique != "") libelle = section " / " sousrubrique
        else if (section != "") libelle = section
        else libelle = "(sans libelle)"
      }
      printf "  - ligne %d : %s\n", NR, libelle
    }
  ' "$fichier_contexte" 2>/dev/null
)"

nb_a_remplir="$(printf '%s' "$champs_a_remplir" | grep -c '^  - ligne' 2>/dev/null || true)"
nb_a_remplir="${nb_a_remplir//[^0-9]/}"
[ -z "$nb_a_remplir" ] && nb_a_remplir=0

if [ "$nb_a_remplir" -gt 0 ]; then
  etat_contexte="**${nb_a_remplir} champs sont encore \`À REMPLIR\`.** Tant qu'un de ces champs bloque la demande en cours, pose la question au lieu de supposer — ne remplis pas un champ de contexte de ta propre initiative.

${champs_a_remplir}"
else
  etat_contexte="Le contexte de mission est entierement renseigne."
fi

# --- Assemblage du bloc injecte --------------------------------------------

bloc="# Contexte de mission — charge automatiquement au demarrage

Ce bloc est produit par le hook \`SessionStart\` du plugin \`amoa-transformation\`,
a partir des fichiers de \`00-contexte/\`. Il fait foi : ne redemande pas ces
informations a l'utilisateur et ne relis pas ces fichiers pour les obtenir.

Racine de mission : \`${racine}\`

## Fiche de contexte

$(lire "$fichier_contexte")

## Etat du contexte

${etat_contexte}
"

decisions="$(lire "$racine/00-contexte/decisions.md")"
if [ -n "$decisions" ]; then
  bloc="${bloc}
## Decisions deja tranchees — ne pas les rouvrir ni les contredire

${decisions}
"
fi

glossaire="$(lire "$racine/00-contexte/glossaire-projet.md")"
if [ -n "$glossaire" ]; then
  bloc="${bloc}
## Glossaire impose — utilise ce vocabulaire, pas un synonyme

${glossaire}
"
fi

parties="$(lire "$racine/00-contexte/parties-prenantes.md")"
if [ -n "$parties" ]; then
  bloc="${bloc}
## Parties prenantes

${parties}
"
fi

bloc="${bloc}
## Numerotation en cours

Calcule sur l'ensemble du depot, archives comprises. Un identifiant abandonne
reste abandonne : reprends la numerotation au \"prochain libre\", jamais a un
identifiant libere.

| Prefixe | Dernier attribue | Prochain libre |
|---|---|---|
${table_numerotation}"

# --- Sortie ----------------------------------------------------------------

if [ "$nb_a_remplir" -gt 0 ]; then
  message="Contexte de mission charge - ${nb_a_remplir} champs encore a remplir dans 00-contexte/contexte-mission.md"
else
  message="Contexte de mission charge"
fi

printf '{"systemMessage":"%s","suppressOutput":true,"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' \
  "$(printf '%s' "$message" | echapper_json)" \
  "$(printf '%s' "$bloc" | echapper_json)"
