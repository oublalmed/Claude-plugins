# Formats de livrables

Chaque section donne la structure attendue. Adapter les intitulés au vocabulaire du client sans jamais supprimer une rubrique de fond.

## 1. Note de cadrage

1. Contexte et enjeux (3 lignes max)
2. Objectifs (formulés en résultat mesurable, SMART)
3. Périmètre — in-scope explicite ET out-of-scope explicite
4. Parties prenantes et gouvernance (RACI si pertinent)
5. Livrables attendus et jalons majeurs
6. Risques et dépendances identifiés à ce stade
7. Critères de succès du projet
8. Budget et ressources, rattachés aux jalons
9. Hypothèses et points à arbitrer

## 2. Expression de besoin

1. Contexte métier et déclencheur du besoin
2. Population(s) demandeuse(s)
3. Besoin exprimé (verbatim si disponible) puis reformulé
4. Objectif métier visé et bénéfice attendu (chiffré si possible)
5. Contraintes connues (délai, budget, SI existant)
6. Périmètre pressenti — sans figer la solution
7. Questions bloquantes à lever avant cadrage

## 3. Analyse de processus AS-IS / TO-BE

1. Processus concerné, déclencheur et résultat attendu
2. AS-IS : description factuelle étape par étape, acteurs, systèmes, points de douleur chiffrés
3. Constats — jamais mélangés avec des décisions
4. TO-BE : au moins 2 scénarios avec leurs arbitrages
5. Écarts AS-IS → TO-BE, impact par acteur
6. Recommandation et justification
7. Gains attendus, mode de mesure

## 4. Spécification fonctionnelle

1. Contexte et objectif de l'évolution
2. Périmètre (in / out)
3. Règles de gestion numérotées `RG-xxx`
4. Exigences fonctionnelles numérotées `EF-xxx`, traçables vers une `RG` et un besoin
5. Cas nominal, cas limites, cas d'erreur pour chaque règle
6. Exigences non fonctionnelles (performance, sécurité, accessibilité, volumétrie)
7. Interfaces amont/aval (format, fréquence, gestion des rejets)
8. Maquettes ou wireframes si disponibles, sinon description d'écran
9. Prochaines étapes et à confirmer avec le métier

## 5. BPMN

1. Nom du processus, déclencheur, événement de fin
2. Swimlanes par acteur/rôle (pas par système, sauf processus automatisé pur)
3. Notation BPMN 2.0 standard : tâches, passerelles exclusives/parallèles, événements
4. Points de contrôle explicites (validation, contrôle qualité, seuil)
5. Chemins d'exception représentés, pas seulement le chemin nominal
6. Légende si des conventions non standard sont utilisées

## 6. Backlog agile / user story

Format : « En tant que [rôle], je veux [action], afin de [valeur] ».

1. Grille INVEST respectée (voir agent `relecteur-user-stories` pour l'audit)
2. Critères d'acceptation vérifiables (Given/When/Then ou équivalent)
3. Definition of Done rappelée ou référencée
4. Priorité et valeur relative justifiées
5. Dépendances vers d'autres stories ou équipes signalées

## 7. Plan de recette

1. Objectif et périmètre de la recette
2. Cas de test numérotés `CT-xxx`, traçables vers une `RG`/`EF`
3. Cas nominal, cas limite, cas d'erreur pour chaque règle de gestion
4. Données de test nécessaires (état avant/après)
5. Environnement de test et écarts connus vs production
6. Rôles : qui exécute, qui valide, qui arbitre
7. Critères de sortie (taux de réussite exigé, anomalies bloquantes tolérées)

## 8. Compte rendu d'atelier

1. Date, participants et rôle de chacun
2. Objectif de l'atelier
3. Décisions prises — isolées, marquées comme telles
4. Actions — propriétaire, échéance, statut
5. Points ouverts — désaccords ou questions non résolues
6. Hypothèses formulées pendant l'atelier, marquées comme telles
7. Prochaines étapes avec échéances

## 9. Matrice de traçabilité

| Besoin | Exigence | Règle de gestion | Spécification | Cas de test | Statut |
|---|---|---|---|---|---|

Voir l'agent `verificateur-tracabilite` pour l'audit de couverture.

## 10. RACI

| Activité / Décision | Responsible | Accountable | Consulted | Informed |
|---|---|---|---|---|

Une seule case Accountable par ligne. Toute ligne avec deux Accountable ou zéro Accountable est un défaut.

## 11. Plan de conduite du changement

1. Cartographie des parties prenantes (impact et niveau d'adhésion actuel)
2. Analyse d'impact par population (tâches, compétences, organisation, outils)
3. Stratégie de communication, différenciée par audience
4. Plan de formation, aligné sur les écarts de compétence identifiés
5. Réseau de relais terrain, si pertinent au regard de la taille de l'organisation
6. Plan de gestion de la résistance
7. Indicateurs d'adoption, avec baseline
8. Plan de renforcement post-déploiement (hypercare, suivi à 30/60/90 jours)

## 12. Support de comité de pilotage

1. Statut global (vert/orange/rouge) et pourquoi, en une phrase, sur le premier slide
2. Avancement vs plan (budget, planning, périmètre) — écarts expliqués, pas juxtaposés
3. Décisions demandées au comité, formulées en questions fermées avec recommandation
4. Risques réels du moment, pas une liste générique reconduite
5. Indicateurs avec tendance (avant/après), pas une photo isolée
6. Suivi des décisions du comité précédent
7. Prochaines étapes
