---
name: aide
description: This skill should be used when the user asks how the AMOA Transformation plugin works, what it can do, or which agent/skill to use for a given deliverable — trigger phrases like "aide", "comment ça marche", "que peux-tu faire pour moi", or "quel agent utiliser pour relire ma spec".
---

Affiche le mode d'emploi du plugin `amoa-transformation`.

## Contenu à présenter

**Skill de socle** — `amoa-transformation` : posture, méthode, formats de livrables. Se déclenche seul dès qu'un livrable AMOA est demandé.

**Skills génératives** :

| Skill | Produit |
|---|---|
| `contexte-mission` | Fiche de contexte de mission, à capturer une fois |
| `note-cadrage` | Note de cadrage / charte de projet, RACI |
| `spec-fonctionnelle` | Spécification fonctionnelle |
| `plan-recette` | Plan de recette |
| `compte-rendu-atelier` | Compte rendu d'atelier métier |
| `plan-conduite-changement` | Plan de conduite du changement |

**Agents relecteurs** (disponibles dans Cowork, en mentionnant `@amoa-transformation:<nom>`) :

| Agent | Relit |
|---|---|
| `relecteur-specifications` | Spécification fonctionnelle |
| `verificateur-tracabilite` | Couverture besoin → exigence → règle → test |
| `relecteur-plan-recette` | Plan de recette / tests |
| `relecteur-atelier` | Compte rendu d'atelier métier |
| `relecteur-user-stories` | User stories / backlog agile |
| `expert-cadrage-gouvernance` | Charte de projet, RACI, gouvernance |
| `expert-conduite-changement` | Plan de conduite du changement, adoption |
| `relecteur-pilotage` | Support de comité de pilotage |

## Recommandation d'usage

1. `contexte-mission` une fois en début de mission.
2. Produire le livrable avec la skill générative correspondante, ou en langage naturel.
3. Avant envoi, faire relire par l'agent correspondant.

Si le sujet est bancaire (core banking, paiements, monétique, réglementation), recommander d'installer aussi le plugin `amoa-bancaire`, qui apporte la profondeur métier bancaire — les deux plugins se combinent sans conflit.
