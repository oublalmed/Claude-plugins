---
name: plan-recette
description: This skill should be used when the user asks to write a test plan or acceptance-testing plan (plan de recette) for any sector — trigger phrases like "prépare le plan de recette", "écris les cas de test", "il faut la recette pour cette évolution", or "constitue le jeu de test".
---

Rédige un plan de recette en appliquant le skill `amoa-transformation`.

## Avant de rédiger

1. Lis `${CLAUDE_PLUGIN_ROOT}/skills/amoa-transformation/references/formats-livrables.md` (section 7).
2. Récupère la spécification fonctionnelle ou les règles de gestion source. Sans elles, les cas de test ne peuvent pas être tracés — pose la question plutôt que d'inventer les règles à tester.

## Rédaction

1. Numérote les cas de test `CT-xxx`, chacun traçable vers une `EF-xxx` ou une `RG-xxx`.
2. Pour chaque règle de gestion : un cas nominal, un cas limite, un cas d'erreur — jamais seulement le chemin heureux.
3. Précise l'état des données avant/après pour chaque cas, pas seulement l'action à réaliser.
4. Ajoute les scénarios de bout en bout traversant plusieurs systèmes si le processus le justifie, pas seulement les cas unitaires écran par écran.
5. Termine par les critères de sortie de la recette (taux de réussite exigé, anomalies bloquantes résiduelles tolérées).

Si l'utilisateur veut un fichier diffusable, produis un `.xlsx`.
