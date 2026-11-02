# La proposition PDF (avec PRD)

Document pour le client et pour son décideur, qui n'était souvent pas dans le call. Il doit
se comprendre sans toi.

## Le PRD, expliqué si besoin

PRD = Product Requirements Document, le « document des exigences produit ». Il dit **quoi** et
**pourquoi**, pas comment : pour qui, quel problème, les fonctionnalités par priorité, ce qui est
exclu, et comment on mesure le succès. C'est le cahier des charges vu côté produit. On le met
**dans** la proposition (2 pages), pas dans un document à part.

**Deux PRD, à deux moments du cycle de vente** :
- **Avant la signature, le PRD léger**, dans la proposition : objectif, utilisateurs,
  fonctionnalités Inclus / Option, hors périmètre, indicateurs. C'est lui qui rend le prix
  compréhensible et qui protège le périmètre (« ce n'était pas inclus »). 2 pages, pas plus :
  au-delà, c'est du travail gratuit sur un projet pas encore signé.
- **Après la signature, le PRD détaillé**, en semaine 1 (le cadrage) : chaque écran, chaque
  règle, les cas limites, les critères d'acceptation. Le client le valide par écrit avant le
  développement, et il sert de référence à la recette.

## Structure (10 à 12 pages A4)

1. **Couverture** : logo du client, titre du produit, la mascotte, « Préparé pour <noms> »,
   ta marque.
2. **Ce que vous nous avez dit** : 4 citations du call (nettoyées, sens intact), 4 constats,
   et « le vrai sujet » en un encadré.
3. **La solution en une page** : une phrase, puis les faces du produit (ex. clients / commerçants /
   back-office), avec qui se connecte et comment. Pourquoi ce format (web app vs app).
4. **Comment ça marche** (1-2 pages) : les écrans clés de la planche de maquettes.
5. **PRD (2 pages)** : objectif produit, objectifs business, tableau des fonctionnalités
   (Inclus / Option), règles métier, hors périmètre, indicateurs de succès.
6. **Ce que ça vous rapporte** : les leviers, la formule de l'investissement sur 3 ans, ce
   qu'il doit rapporter, les chiffres à nous transmettre. Pas de chiffre inventé.
7. **Nos idées marketing (offertes)** et **ce qui reste de votre côté** : les conditions de
   réussite, avec une case à cocher et un responsable par action.
8. **Garanties techniques** (en langage client : tient le pic d'un buzz, deux environnements,
   RGPD et Europe, tout est à votre nom, sauvegardes, formation) et **calendrier** calé sur la
   saison du client.
9. **Investissement** : setup (avec la liste de ce qui est inclus), maintenance, options en prix
   indicatifs, mentions légales, prochaines étapes, signature.

## À faire valider avant envoi

Tout ce que l'IA a ajouté d'elle-même : les mentions fiscales (en France, par exemple
« TVA non applicable, art. 293 B du CGI » si tu es en franchise), le prix des options, les noms
et chiffres fictifs des maquettes (l'écrire en bas des pages concernées).

**Ne pas mettre** de modalités de paiement ni de date de validité par défaut : c'est souvent au
client de proposer ses conditions, et une urgence artificielle abîme la confiance. À toi de voir.

## Mise en page

- Pages `.page{width:210mm;height:297mm;overflow:hidden}`, `@page{size:A4;margin:0}`,
  `print-color-adjust:exact`. Un en-tête (logo client) et un pied (titre + numéro) par page.
- Couleurs et typo : celles de la DA validée, pour que PDF, maquettes et vidéo se répondent.
- Export et contrôle : `scripts/pdf.sh <html> <pdf> <dossier-aperçus>` (Chrome + poppler), puis
  regarder chaque page. Les défauts habituels : un bloc qui déborde en bas de page (la signature
  disparaît), une mascotte qui chevauche une carte, une carte de données trop pâle.
- Émetteur : ton nom, ta marque, ton email et ton numéro d'entreprise (à demander à l'utilisateur
  la première fois, puis à noter dans le CLAUDE.md du projet).
