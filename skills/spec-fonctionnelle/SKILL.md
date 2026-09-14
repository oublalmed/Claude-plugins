---
name: spec-fonctionnelle
description: This skill should be used when the user asks to write a functional specification for any sector (not banking-specific) — trigger phrases like "rédige une spécification fonctionnelle", "écris la spec pour cette évolution", "documente ce besoin fonctionnellement", or "prépare le cahier des charges fonctionnel".
---

Rédige une spécification fonctionnelle en appliquant le skill `amoa-transformation`.

## Avant de rédiger

1. Lis `${CLAUDE_PLUGIN_ROOT}/skills/amoa-transformation/references/formats-livrables.md` (section 4) et `${CLAUDE_PLUGIN_ROOT}/skills/amoa-transformation/references/checklist-qualite.md`.
2. Si le contexte de mission est bancaire ou financier, applique aussi le skill `amoa-bancaire` s'il est installé, et le skill `monetique` si le sujet touche aux cartes, TPE, GAB ou e-commerce.
3. Vérifie que tu disposes du processus concerné, du système cible, des règles métier existantes et des interfaces amont/aval. Si l'un manque, pose la question et arrête-toi.

## Rédaction

1. Numérote les exigences `EF-xxx` et les règles de gestion `RG-xxx`.
2. Pour chaque règle de gestion, couvre le cas nominal, un cas limite et un cas d'erreur.
3. Explicite les exigences non fonctionnelles (performance, sécurité, accessibilité, volumétrie) même si elles semblent évidentes — une exigence non écrite n'est pas spécifiée.
4. Termine par « Prochaines étapes » et « À confirmer avec le métier ».

Si l'utilisateur veut un fichier diffusable, produis un `.docx`.
