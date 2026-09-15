---
name: contexte-mission
description: This skill should be used when the user asks to capture, save, or record the context of an AMOA / business-transformation consulting mission — trigger phrases like "enregistre le contexte de ma mission", "capture le contexte du projet", "prépare une fiche de contexte pour ce client", or at the very start of a new engagement before producing any other deliverable. Also use it automatically when a deliverable is requested and no mission-context file exists yet.
---

Capture le contexte d'une mission AMOA une fois, pour éviter de le répéter à chaque échange.

## Méthode

1. Lis `${CLAUDE_PLUGIN_ROOT}/skills/amoa-transformation/references/template-appel.md`.
2. Pose les questions du template une par une ou groupées par thème, en laissant l'utilisateur répondre « je ne sais pas encore » sur les points non bloquants.
3. Ne bloque pas sur les champs secondaires : marque-les `À REMPLIR` plutôt que d'interrompre la capture.
4. **Écris toi-même la fiche sur disque** — ne demande pas à l'utilisateur de la recopier :
   - si `00-contexte/` existe dans le projet → `00-contexte/contexte-mission.md`
   - sinon si un `CLAUDE.md` de projet désigne un emplacement → celui-là
   - sinon → crée `00-contexte/contexte-mission.md`
5. Si le fichier existe déjà, **complète-le** au lieu de l'écraser : conserve les champs renseignés, remplis les `À REMPLIR` avec ce que l'utilisateur vient de fournir, et signale ce qui reste ouvert.
6. Confirme à l'utilisateur le chemin écrit et liste les champs encore `À REMPLIR`.

Une fois ce fichier en place, il est relu automatiquement au début de chaque échange : l'utilisateur n'a plus rien à répéter ni à copier.

## Format de sortie

Une fiche « Contexte de mission — [nom du projet] » reprenant les rubriques du template, écrite dans le fichier. En conversation, ne renvoie que le chemin du fichier et la liste des champs restant à compléter — pas la fiche entière.

## Ce que tu ne fais pas

- Tu n'inventes pas de valeur pour un champ non renseigné : tu la marques `À REMPLIR`.
- Tu n'écrases pas un champ déjà renseigné par l'utilisateur.
- Tu ne produis pas d'autre livrable à ce stade — la capture de contexte est une étape séparée.
