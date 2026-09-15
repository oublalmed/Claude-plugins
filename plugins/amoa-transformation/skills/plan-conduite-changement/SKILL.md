---
name: plan-conduite-changement
description: This skill should be used when the user asks to write a change-management plan, adoption strategy, or communication/training plan for a transformation project — trigger phrases like "rédige un plan de conduite du changement", "comment faire adopter cet outil", "prépare la stratégie de communication du projet", or "il faut un plan de formation pour ce déploiement".
---

Rédige un plan de conduite du changement en appliquant le skill `amoa-transformation`.

## Avant de rédiger

1. Lis `${CLAUDE_PLUGIN_ROOT}/skills/amoa-transformation/references/formats-livrables.md` (section 11).
2. Vérifie que tu disposes : des populations impactées, de la nature du changement (outil, processus, organisation), et de l'échéance de déploiement. Sans la cartographie des populations impactées, le plan ne peut pas être différencié par audience — pose la question plutôt que de produire un plan générique.

## Rédaction

1. Cartographie chaque population impactée avec son niveau d'adhésion actuel estimé (sponsor, relais, neutre, sceptique, opposant).
2. Qualifie l'impact par population sur 4 axes : tâches, compétences, organisation, outils.
3. Différencie les messages de communication par audience — jamais un message unique diffusé à tous.
4. Aligne le contenu de formation sur les écarts de compétence réels identifiés, pas sur un catalogue générique.
5. Anticipe les sources de résistance prévisibles avec un plan de traitement, avant qu'elles ne se manifestent au déploiement.
6. Définis des indicateurs d'adoption avec une baseline (taux d'utilisation actuel, s'il existe une solution antérieure).
7. Termine par un plan de renforcement post-déploiement (hypercare, suivi à 30/60/90 jours).

Utilise les grilles ADKAR ou Kotter comme structure si l'utilisateur n'en impose pas d'autre.

Si l'utilisateur veut un fichier diffusable, produis un `.docx` ou un `.pptx` selon l'usage prévu (document projet ou support de présentation).
