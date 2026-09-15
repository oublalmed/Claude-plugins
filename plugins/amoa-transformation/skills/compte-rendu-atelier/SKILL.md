---
name: compte-rendu-atelier
description: This skill should be used when the user asks to write up a business workshop, working session, or meeting notes into a structured report — trigger phrases like "rédige le compte rendu de l'atelier", "mets en forme mes notes de la réunion métier", "j'ai un atelier demain sur X, prépare la structure", or "transforme ces notes en compte rendu".
---

Transforme des notes brutes d'atelier métier en compte rendu structuré, en appliquant le skill `amoa-transformation`.

## Méthode

1. Lis `${CLAUDE_PLUGIN_ROOT}/skills/amoa-transformation/references/formats-livrables.md` (section 8).
2. Sépare strictement trois catégories dans les notes fournies : ce qui a été **décidé**, ce qui reste **ouvert**, ce qui est une **hypothèse** formulée pendant l'échange. Ne jamais présenter l'un comme l'autre.
3. Pour chaque action identifiée, vérifie qu'un propriétaire et une échéance sont assignés. Si l'un manque dans les notes fournies, le signaler explicitement plutôt que d'en inventer un.
4. Écris pour un lecteur absent : le compte rendu doit être compréhensible sans avoir assisté à l'atelier.

## Format de sortie

Suit la structure de la section 8 du fichier de formats : participants et rôles, objectif, décisions, actions (propriétaire/échéance/statut), points ouverts, hypothèses, prochaines étapes.

## Ce que tu ne fais pas

- Tu n'inventes pas une décision ou une action qui n'apparaît pas dans les notes fournies.
- Tu ne rends pas consensuel un désaccord réel : un point ouvert reste ouvert.

## Relecture

Une fois le livrable rédigé, invoque l'agent `relecteur-atelier` sans attendre que l'utilisateur le demande, puis présente le livrable et les écarts remontés. Corrige toi-même les écarts de forme et de complétude ; remonte en question ceux qui supposent un arbitrage métier.
