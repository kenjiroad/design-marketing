---
name: design-marketing
description: La réflexion produit, marketing et design pour un projet client ou perso (app, web app, site, carte, outil, back-office, PWA). À partir d'un call, d'un brief ou d'une idée, trouve le vrai sujet (souvent la donnée et l'adoption, pas l'outil), vérifie que le projet peut rapporter au moins 3 fois son prix, pense la distribution à budget nul, sépare ce que livre le prestataire de ce que fait le client, puis construit une DA premium « software / tech » (jamais une « app de 2010 ») à partir de références (Dribbble, Behance), de la marque et d'une idée-signature propre au produit. Livre une planche de maquettes HTML vérifiée par captures et une proposition PDF avec PRD. Utiliser quand l'utilisateur dit « /design-marketing », « fais-moi la DA », « une maquette », « propose un design », « rends ça premium », « ça fait app de 2010 », « comment on distribue ce truc », « est-ce que ça va leur rapporter », « un PRD », « la proposition pour <client> », ou colle des liens Dribbble ou Behance.
---

# Design & marketing produit

Ce skill sert à vendre et à construire des outils sur mesure qui détonnent dans leur secteur.
Deux choses font signer et durer ces projets :

1. **Une réflexion qui dépasse l'outil.** Le client croit acheter une app ; ce qui décide du
   succès, c'est presque toujours la donnée (qui la fournit, comment elle reste juste), l'adoption
   (comment les gens apprennent que l'outil existe) et ce que ça rapporte. Un client ne doit pas
   payer pour un service qui ne lui rapporte pas au moins le triple.
2. **Un design qui détonne dans son secteur.** Une interface au niveau des apps que les gens
   utilisent tous les jours, avec une idée qui n'appartient qu'à ce produit. C'est ce décalage
   qui impressionne en rendez-vous.

Ce skill enchaîne les deux, dans cet ordre : on ne dessine rien tant qu'on n'a pas compris
ce qui fera marcher le produit.

## Où ranger le travail

Un dossier par projet, jamais mélangé avec un autre client :

```
<Projet>/
├── CLAUDE.md        contexte, décisions datées, points à confirmer marqués 🟡
├── 00-call/         transcript et résumé bruts
├── 01-analyse/      l'avis, la distribution et le ROI
├── 02-proposition/  architecture technique (interne) + proposition HTML/PDF (client)
├── 03-marque/       ressources du client, character sheet, détourages, icône
└── 04-maquettes/    la planche HTML + aperçu JPG + données
```

Le CLAUDE.md est la mémoire du projet : y noter chaque décision de l'utilisateur avec sa date, et
ce qui reste à confirmer. Un agent qui reprend le projet doit pouvoir s'y retrouver sans la
conversation.

## Partie 1 : la réflexion produit et marketing

### 1.1 Lire la matière brute

Transcript du call, mails, site du client, notes : méthodes dans `references/sources.md`.
Deux pièges y sont décrits et reviennent souvent : l'outil de transcription qui attribue une phrase
au mauvais locuteur, et un chiffre du call rattaché à la mauvaise marque ou au mauvais projet.
Vérifier les deux avant d'écrire quoi que ce soit.

### 1.2 Trouver le vrai sujet

Se poser ces questions et y répondre par écrit :
- **Qui alimente l'outil, et pourquoi le ferait-il ?** Un utilisateur sans intérêt direct ne
  contribue pas (« comme sur Waze »). Chercher l'acteur qui y gagne (souvent le commerçant, le
  revendeur, le partenaire) et le faire contribuer par intérêt.
- **Que voit-on le jour 1 ?** Un outil vide au lancement est mort. Comment le remplir avant ?
- **Qu'est-ce qui le rend faux au bout de quelques jours ?** Stocks, prix, horaires : la
  fraîcheur de l'info se conçoit dès le départ.
- **Comment les gens apprennent-ils qu'il existe ?**
- **Quel blocage le client a-t-il déjà rencontré ?** (ex. un partenaire qui refuse de partager
  ses données). Chercher la manière de le contourner plutôt que de le forcer : faire relayer un
  lien d'inscription au lieu de demander le fichier.
- **Qui décide, et était-il dans le call ?** S'il n'y était pas, il faut un argument qui parle à
  sa fonction (pour un dirigeant : des ventes, des points de vente, une donnée commerciale).

Écrire le vrai sujet en une phrase. Exemple type : « le livrable, ce n'est pas l'app, c'est la donnée ».

### 1.3 Le test ×3

Calculer ce que le client paiera sur 3 ans (setup + maintenance × 3) et viser au moins le
triple en valeur. Lister les leviers (plus de points de vente, plus de ventes par client, temps
gagné) et regarder honnêtement lesquels peuvent atteindre ce montant. Le temps gagné suffit
rarement à lui seul.

Dans un document client, ne jamais présenter un chiffre inventé comme une prévision : donner la
formule et la liste des chiffres à lui demander. Si aucun levier ne peut atteindre ×3, le dire à
l'utilisateur et proposer plus petit, ou d'attendre.

### 1.4 La distribution à budget (presque) nul

Partir du principe que le client n'a pas de budget média. Deux listes :
- **Ce que l'outil fait seul**, livré avec le produit : pages Google par ville ou par
  catégorie, QR codes, affichettes générées, images de partage, liens suivis par canal.
- **Ce que le client fait gratuitement** : ses réseaux, une réponse type avec le lien, sa PLV
  et ses supports déjà en place, ses partenaires, un communiqué de presse, les créateurs déjà
  fans de la marque (des produits offerts plutôt qu'un cachet, sans obligation de poster).

### 1.5 Les rôles

Le prestataire livre **le produit** et **offre des idées marketing**. Le client **exécute** son
marketing. Les actions côté client apparaissent dans la proposition comme des **conditions de
réussite** (avec un responsable par action), pas comme une prestation. Ne pas proposer de
prendre le marketing en charge, sauf si le client le demande lui-même.

### 1.6 Le format

Usage ponctuel et trafic venu des réseaux sociaux : **web app d'abord** (un lien s'ouvre tout
de suite, un passage par l'App Store fait perdre la plupart des gens). L'app native vient en
option sur le même backend. Inverser seulement si l'usage est quotidien ou si des
notifications sont au cœur du produit.

### Ce qu'on rend à ce stade

Dans le chat : un verdict en une phrase, 3 à 6 points (le vrai sujet, la donnée, le format, le
ROI, la distribution, les idées de l'utilisateur passées au crible avec leurs limites), puis les
questions qui lui reviennent. Dans `01-analyse/` : la version complète. **Attendre son point**
avant la DA : prix, périmètre et rôles sont ses décisions.

## Partie 2 : la DA premium

### 2.1 Les entrées

- **Les références de l'utilisateur** (souvent Dribbble) : les récupérer et les regarder vraiment
  (`references/sources.md`). S'il n'en a pas donné, lui en demander 2 ou 3, ou proposer une
  direction en décrivant ce qu'on vise.
- **La marque du client** : logo, couleurs, mascotte, ton des campagnes.
- **Le vrai sujet** trouvé en partie 1 : il nourrit l'idée-signature.

### 2.2 Comprendre ce qui rend les références premium

Écrire 6 à 8 traits concrets, pas « c'est moderne ». Exemples de traits : une couleur
dominante en dégradé, de la transparence, des grands chiffres, une grotesk mélangée à un
italique avec empattements, des cartes très arrondies, une navigation en pilule sombre, peu
d'éléments par écran. On s'inspire de ces principes, on ne copie pas les écrans.

### 2.3 Le plan de DA, avant tout code

Quatre lignes, présentées à l'utilisateur en même temps que le travail :
- **Couleurs** : 4 à 6 valeurs nommées, tirées de la marque mais rendues modernes. La couleur
  du logo devient un dégradé. Une couleur de marque très saturée (souvent le jaune) reste en
  lueur ou en accent : en aplat avec une autre couleur primaire, elle date l'interface. Une
  couleur d'action empruntée à l'univers du produit (un parfum, une matière, un lieu).
- **Typo** : une paire de la même famille ou très contrastée. Une grotesk pour l'interface, un
  italique serif pour la voix de la marque et les grands chiffres. Changer de paire d'un client
  à l'autre (ex. Geist + Instrument Serif ; Instrument Sans + Instrument Serif).
- **L'idée-signature** (voir 2.4).
- **L'élément héros** : la pièce la plus spectaculaire (une carte 3D animée, une jauge, un
  parcours), celle qui fera la couverture du PDF et le plan fort d'une vidéo.

### 2.4 L'idée-signature

C'est ce qui empêche le design d'être un template. Elle naît du croisement entre **la nature
du produit** et **le vrai problème**. Exemple type : pour une app qui dit où trouver un produit
glacé, une info qui vieillit s'affiche comme un produit qui fond (« Glacé / Ça fond / Fondu »).

Pour la trouver : de quoi le produit est-il fait, quelle est sa forme, son geste, son
vocabulaire ? Quelle donnée l'outil doit-il rendre lisible ? Comment l'une peut-elle raconter
l'autre ? Mettre l'audace là et dans l'élément héros ; tout le reste reste sobre.

Si le client a une mascotte, l'utiliser (character sheet, détourages, icône d'app : voir
`references/sources.md`). Une mascotte qui devient le logo de l'app, ça marche très bien.

### 2.5 Construire la planche

Un seul fichier `04-maquettes/maquettes.html` qui s'ouvre d'un double-clic (`file://`) :
- le JavaScript en module **dans** la page (un module local importé est bloqué en `file://`),
  les données en script classique (`data/*.js` qui définit `window.X`), three.js via importmap
  depuis `cdn.jsdelivr.net` avec une version fixée ;
- des téléphones à la vraie taille (390 × 844, mis à l'échelle), des modèles d'écran réutilisés
  dans le hero et dans le parcours ;
- toute animation pilotée par un temps `t`, avec `?t=8` dans l'URL pour la figer : ça sert aux
  captures, au PDF et plus tard à une vidéo ;
- des données d'exemple crédibles, signalées comme fictives en bas de page.

Sections habituelles : hero (les téléphones en éventail, la mascotte, le titre), l'idée-signature
expliquée, l'élément héros, le parcours utilisateur écran par écran, le côté partenaire, le
back-office.

Éviter les tics des pages générées : étiquettes en majuscules espacées au-dessus de chaque
titre, petites étiquettes en monospace, méta-textes séparés par des points médians, flèches
« → » dans les boutons, cartes toutes identiques avec la même ombre grise.

### 2.6 Se relire avec des captures

`scripts/shoot.sh <maquettes.html> <dossier> 6400 "?t=8"` (WebGL compris, macOS + Chrome +
ImageMagick), puis regarder chaque tranche comme un client le ferait. Les défauts typiques : une
mascotte qui cache un texte, une bulle d'info qui masque la donnée, des zones qu'on ne distingue
pas, un élément décentré ou rogné dans un bloc étroit, un débordement. Corriger, recapturer, puis
seulement montrer. Exporter un `maquettes-apercu.jpg` et ouvrir la page dans le navigateur
de l'utilisateur.

Pour lui présenter : ce qui change par rapport à avant, l'idée-signature, l'élément héros, ce
qui est fictif, et les choix qu'il peut corriger.

## Partie 3 : la proposition

Une fois la DA validée : la proposition PDF avec le PRD intégré, aux couleurs de la DA (structure
et contrôles dans `references/proposition-pdf.md`, export avec `scripts/pdf.sh`). Les écrans
HTML de la planche s'y réutilisent tels quels, et dans une vidéo si besoin.

## Les règles qui ne bougent pas

- Rien ne part au client sans le GO de l'utilisateur : PDF, mails, vidéo, liens.
- Prix, périmètre, rôles et période de maintenance sont ses décisions. Proposer, puis lui
  demander de trancher. Recompter les durées (« mai à septembre » = 5 mois, pas 6).
- La mascotte et la marque restent la propriété du client. On ne publie pas de page à leur
  image sur une URL publique : on travaille en fichiers locaux.
- Tout chiffre fictif est signalé comme tel. Tout chiffre réel a une source.
