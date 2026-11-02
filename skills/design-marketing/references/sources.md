# Récupérer la matière brute

Tout part de ce que le client a dit et de ce que l'utilisateur a montré. Rien ne se fait de mémoire.

## Le call

Partir du transcript complet (Fathom, Granola, tl;dv, Zoom, Meet… peu importe l'outil), pas
seulement du résumé automatique. Le ranger dans `00-call/`.

**Piège connu** : quand deux personnes partagent un micro, l'outil les fusionne en un seul
locuteur et attribue des phrases du client au prestataire (et inversement). Relire les répliques
importantes en se demandant « qui parle vraiment ? » (un « nous » côté client, un chiffre de
leur budget…), et l'écrire en tête du fichier transcript.

**Piège connu n°2** : un chiffre cité dans le call appartient à une marque, un projet, une année.
Un client qui gère plusieurs marques peut citer le budget de l'une en parlant de l'autre.
Attribuer chaque chiffre à sa source ; en cas de doute, demander à l'utilisateur.

## Les références visuelles (Dribbble, Behance)

Dribbble bloque souvent les requêtes simples (page vide). Chrome sans interface passe :

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new \
  --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0 Safari/537.36" \
  --virtual-time-budget=20000 --dump-dom "<url du shot>" > dom.html
grep -o -E 'https://cdn\.dribbble\.com/userupload/[^"'"'"' ]+' dom.html | sed 's/?.*//' | sort -u
```

La page liste aussi d'autres shots : les médias du shot demandé ont des identifiants
`userupload/<n>` qui se suivent. Télécharger les images et la vidéo du shot dans un dossier à
part, puis les regarder (réduire d'abord à ~1300 px de large avec `sips -Z 1300`).

Si une extension de navigateur pilotée par l'IA est connectée, elle marche aussi ; sinon ne
pas insister.

## La marque du client (site officiel)

1. Lire le site : la liste des images (logo, mascotte, affiches de campagne, produits), les
   couleurs, le ton, les slogans, la gamme.
2. Télécharger les visuels dans `03-marque/sources-<site>/` du dossier projet.
3. Vérifier la transparence (mode RGBA, alpha min 0) : les visuels de site sont souvent déjà
   détourés, c'est de l'or pour la couverture et l'app.
4. Lire les affiches : elles donnent le ton de la marque.

## La mascotte : character sheet réutilisable

Seulement si le client a une mascotte (ou si l'utilisateur le demande).

1. Avec un générateur d'images qui accepte des images de référence (par exemple Higgsfield ou
   Nano Banana) : donner les 2 meilleures références (une pose en pied + une affiche).
2. Deux planches : la mascotte vue sous 4 angles, et 6 poses utiles à l'histoire du produit
   (salue, cherche, regarde son téléphone, montre du doigt, joie avec le produit, perplexe).
   Vérifier le coût en crédits avant de lancer.
3. Détourage : `swift scripts/cutout.swift <planche.png> <dossier> <prefixe>` (Vision de macOS,
   une image transparente par personnage, triées de haut en bas puis de gauche à droite).
   Renommer ensuite par pose (`mascotte-salut.png`, `mascotte-cherche.png`…).
4. Icône d'app : détourer la vue de face, puis
   `python3 -I scripts/app_icon.py <vue-face.png> <dossier> <couleur1> <couleur2>`.
5. Planche de contrôle : coller les détourages sur un fond coloré vif et la regarder.

La mascotte est la propriété du client : usage limité à la proposition, accord du client
pour toute réutilisation. L'écrire dans le CLAUDE.md du projet.

## Le contexte

Chercher le prospect dans les notes et les mails de l'utilisateur (nom de la marque, du groupe,
des interlocuteurs) : un mail d'origine donne souvent le contexte. Lui demander où se trouve son
offre du moment (prix, modules) avant de chiffrer quoi que ce soit.
