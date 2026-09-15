---
name: note-cadrage
description: This skill should be used when the user asks to write a project charter, scoping note, or governance framework for a transformation project — trigger phrases like "rédige une note de cadrage", "prépare la charte de projet", "il faut cadrer ce projet", "définis le RACI et la gouvernance", or "on démarre un nouveau projet, il faut le cadrer".
---

Rédige une note de cadrage en appliquant le skill `amoa-transformation`.

## Avant de rédiger

1. Lis `${CLAUDE_PLUGIN_ROOT}/skills/amoa-transformation/references/formats-livrables.md` (section 1 — Note de cadrage).
2. Vérifie que tu disposes : de l'objectif du projet, du périmètre pressenti, des parties prenantes principales et du sponsor. Si l'un manque, pose la question et arrête-toi — un cadrage bâti sur un objectif flou ne peut pas être corrigé plus tard sans tout reprendre.
3. Si un RACI est demandé ou pertinent au vu de la gouvernance décrite, l'inclure directement dans la note.

## Rédaction

1. Formule les objectifs en résultat mesurable (SMART), jamais en intention.
2. Explicite le out-of-scope autant que le in-scope.
3. Rattache le budget et les ressources aux livrables et jalons, pas à une enveloppe globale.
4. Termine par « Hypothèses et points à arbitrer », en distinguant clairement ce qui est une hypothèse de ce qui est déjà tranché.

Si l'utilisateur veut un fichier diffusable, produis un `.docx`.

## Relecture

Une fois le livrable rédigé, invoque l'agent `expert-cadrage-gouvernance` sans attendre que l'utilisateur le demande, puis présente le livrable et les écarts remontés. Corrige toi-même les écarts de forme et de complétude ; remonte en question ceux qui supposent un arbitrage métier.
