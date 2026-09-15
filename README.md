# AMOA Transformation — plugin Claude

Livrables AMOA / Business Analyst pour missions de conseil en transformation digitale et process, tous secteurs. Complémentaire du plugin `amoa-bancaire` (dédié banque/monétique) : les deux se combinent sans conflit sur une mission bancaire.

## Démarrage en 3 étapes

1. Installer le plugin (voir ci-dessous).
2. Utiliser la skill `contexte-mission` une fois, en décrivant votre mission. Déposer la fiche produite dans la base de connaissances de votre Projet Claude.
3. Demander vos livrables, en langage naturel ou en nommant la skill.

La skill `aide` affiche le mode d'emploi à tout moment.

## Contenu

| Composant | Nom | Rôle |
|---|---|---|
| Skill | `amoa-transformation` | Posture, arbitrages, méthode, conditions d'arrêt, 12 formats de livrables |
| Skill | `contexte-mission` | Capture du contexte de mission, une fois par mission |
| Skill | `note-cadrage` | Note de cadrage / charte de projet et RACI |
| Skill | `spec-fonctionnelle` | Spécification fonctionnelle générique |
| Skill | `plan-recette` | Plan de recette |
| Skill | `compte-rendu-atelier` | Mise en forme d'un compte rendu d'atelier métier |
| Skill | `plan-conduite-changement` | Plan de conduite du changement / adoption |
| Skill | `aide` | Mode d'emploi |
| Sub-agent | `relecteur-specifications` | Relecture de spécification : complétude, testabilité, ambiguïté |
| Sub-agent | `verificateur-tracabilite` | Couverture besoin → exigence → règle → test |
| Sub-agent | `relecteur-plan-recette` | Relecture de plan de recette / tests |
| Sub-agent | `relecteur-atelier` | Relecture de compte rendu d'atelier métier |
| Sub-agent | `relecteur-user-stories` | Relecture de backlog agile (grille INVEST) |
| Sub-agent | `expert-cadrage-gouvernance` | Relecture de charte de projet, RACI, gouvernance |
| Sub-agent | `expert-conduite-changement` | Relecture de plan de conduite du changement, risques d'adoption |
| Sub-agent | `relecteur-pilotage` | Relecture de support de comité de pilotage |

Le skill de socle se déclenche seul. Les skills génératives et les sub-agents sont des raccourcis, jamais une obligation : tout fonctionne aussi en langage naturel.

## Installation

### Claude Code

```
/plugin marketplace add oublalmed/Claude-plugins
/plugin install amoa-transformation@claude-plugins-marketplace
```

Puis redémarrer la session pour que les skills et sub-agents soient chargés.

### Claude.ai / Cowork

Customize (barre latérale gauche) > onglet Plugins > téléverser le zip.
Dans Cowork, ouvrir d'abord l'onglet Cowork, puis Customize.

## Limites connues

| Limite | Détail |
|---|---|
| Sub-agents | Ne tournent que dans Cowork. En chat ils apparaissent grisés ; skills fonctionnent normalement. |
| Connecteurs | Aucun n'est déclaré par défaut. |
| Contraintes sectorielles | Ce plugin ne connaît pas les spécificités réglementaires d'un secteur donné (bancaire, santé, assurance...). Pour la banque, installer aussi `amoa-bancaire`. Pour d'autres secteurs réglementés, fournir la contrainte explicitement dans la demande. |

## Usage type

```
Contexte : Groupe industriel X, déploiement d'un nouvel ERP achats sur 12 sites
[via la skill contexte-mission]

Rédige la note de cadrage du projet
Prépare le plan de conduite du changement pour le déploiement du site pilote
```

Puis dans Cowork, avant envoi :

```
@amoa-transformation:relecteur-specifications relis cette spec
@amoa-transformation:expert-conduite-changement évalue les risques d'adoption
@amoa-transformation:relecteur-pilotage relis ce support avant le copil de vendredi
```

## Versions

| Version | Contenu |
|---|---|
| 0.1.0 | Skill de socle, 6 skills génératives, 8 sub-agents relecteurs |
