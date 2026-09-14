---
name: contexte-mission
description: This skill should be used when the user asks to capture, save, or record the context of an AMOA / business-transformation consulting mission — trigger phrases like "enregistre le contexte de ma mission", "capture le contexte du projet", "prépare une fiche de contexte pour ce client", or at the very start of a new engagement before producing any other deliverable.
---

Capture le contexte d'une mission AMOA une fois, pour éviter de le répéter à chaque échange.

## Méthode

1. Lis `${CLAUDE_PLUGIN_ROOT}/skills/amoa-transformation/references/template-appel.md`.
2. Pose les questions du template une par une ou groupées par thème, en laissant l'utilisateur répondre « je ne sais pas encore » sur les points non bloquants.
3. Ne bloque pas sur les champs secondaires : marque-les `[À COMPLÉTER]` plutôt que d'interrompre la capture.
4. Produis une fiche de contexte structurée, courte (une page), reprenant les rubriques du template.
5. Recommande explicitement à l'utilisateur de déposer cette fiche dans la base de connaissances de son projet Claude, pour que les futurs échanges en héritent automatiquement sans avoir à la répéter.

## Format de sortie

Une fiche « Contexte de mission — [nom du projet] » avec les rubriques du template, prête à être copiée telle quelle.

## Ce que tu ne fais pas

- Tu n'inventes pas de valeur pour un champ non renseigné : tu la marques `[À COMPLÉTER]`.
- Tu ne produis pas d'autre livrable à ce stade — la capture de contexte est une étape séparée.
