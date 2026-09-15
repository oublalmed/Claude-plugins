# Checklist qualité — à passer avant de rendre

## 1. Traçabilité

Chaque exigence fonctionnelle (`EF-xxx`) remonte à un besoin, et descend vers au moins une règle de gestion (`RG-xxx`) et un cas de test (`CT-xxx`). Un élément sans amont est un orphelin ; un élément sans aval est un trou de couverture. Les deux sont des défauts à signaler, pas à laisser passer silencieusement.

## 2. Couverture de test

Pour chaque règle de gestion : un cas nominal, un cas limite, un cas d'erreur. Une règle avec moins de trois cas est incomplète. Un cas de test sans donnée de test associée n'est pas exécutable.

## 3. Risques

Chaque risque a un propriétaire nommé, une criticité (probabilité × impact) et une mesure de mitigation concrète — pas seulement « à surveiller ». Un risque sans propriétaire ne sera traité par personne.

## 4. Impacts sur 4 axes

Tout changement est qualifié sur : SI (systèmes touchés), Processus (étapes modifiées), Organisation/RH (compétences, effectifs, rôles), Parties prenantes externes (clients, fournisseurs, régulateurs le cas échéant). Un impact non qualifié sur l'un des quatre axes est une zone d'ombre, pas une absence d'impact.

## 5. Adoption et conduite du changement

Tout livrable qui suppose un changement d'usage traite l'adoption comme un chantier à part entière : population impactée, niveau d'adhésion actuel, plan d'accompagnement, indicateur de suivi. Un plan de déploiement sans volet adoption n'est pas complet, quelle que soit la qualité de la solution technique.

## 6. KPI

Chaque indicateur a une baseline (valeur actuelle mesurée, pas estimée), une cible, un mode de mesure et une fréquence. Un KPI sans baseline ne permet pas de mesurer un progrès.

## 7. Chasse aux formules creuses

Bannir : « il conviendra de », « une attention particulière sera portée à », « dans la mesure du possible », « le cas échéant » sans préciser le cas. Chaque phrase doit être actionnable ou supprimée.

## 8. Distinction constat / décision / hypothèse

Un constat décrit l'existant, factuellement. Une décision engage une action, avec un porteur. Une hypothèse est une supposition non validée, marquée `[HYPOTHÈSE — à confirmer]`. Un livrable qui mélange les trois sans les distinguer visuellement ne passe pas en comité.

## 9. Clôture obligatoire

Tout livrable se termine par « Prochaines étapes » et « À confirmer » (ou équivalent selon le format). Ces deux sections ne sont jamais optionnelles, même si elles sont courtes.
