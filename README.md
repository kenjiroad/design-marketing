# design-marketing

Le skill que j'utilise avant de designer un site ou une app. Il trouve d'abord **ce qui fera vraiment marcher le produit**, pour toi ou pour ton client, puis il construit une **DA premium** qui se démarque dans ton secteur, au lieu du site « généré par l'IA » que tout le monde reconnaît.

Il marche avec Claude Code, et avec les autres agents qui lisent les skills (Cursor, Codex…).

## Ce qu'il fait, dans l'ordre

1. **Le vrai sujet.** Qui alimente l'outil, et pourquoi ? Que voit-on le premier jour ? Qu'est-ce qui le rend faux au bout d'une semaine ? Comment les gens apprennent-ils qu'il existe ?
2. **Le test ×3.** Le projet doit pouvoir rapporter au moins trois fois ce qu'il coûte sur trois ans. Sinon, il le dit et propose plus petit.
3. **La distribution sans budget.** Ce que l'outil fait seul, et ce que le client peut faire gratuitement.
4. **La DA premium.** À partir de tes références (Dribbble, Behance), de la marque et d'une idée-signature qui n'appartient qu'à ce produit.
5. **La planche de maquettes**, relue par captures d'écran comme un client la regarderait, puis la **proposition PDF** avec un PRD.

## Installer

**En une commande** (Claude Code, Cursor, Codex…) :

```bash
npx skills@latest add kenjiroad/design-marketing
```

**À la main dans Claude Code** : télécharge le dépôt (bouton vert « Code » → « Download ZIP »), puis copie le dossier `skills/design-marketing` dans `~/.claude/skills/`.

**Dans l'appli Claude** (offres Pro, Max, Team, Enterprise) : télécharge [design-marketing-skill.zip](https://github.com/kenjiroad/design-marketing/raw/main/design-marketing-skill.zip), puis va dans **Paramètres → Capacités → Skills → Importer un skill**. L'exécution de code doit être activée.

## L'utiliser

Tape `/design-marketing` ou parle normalement :

> /design-marketing : voici le transcript de mon call avec [client]. Trouve le vrai sujet avant de proposer une DA.

Les scripts de capture et d'export PDF (`scripts/`) sont faits pour macOS, avec Google Chrome. Le skill marche sans eux : tu relis alors les maquettes toi-même.

## Les deux autres skills de l'épisode

- Les skills d'Emil Kowalski : [github.com/emilkowalski/skills](https://github.com/emilkowalski/skills)
- Impeccable : [github.com/pbakaus/impeccable](https://github.com/pbakaus/impeccable)

## Licence

Libre, sous licence MIT : utilise-le, modifie-le, partage-le, même pour un usage commercial (voir `LICENSE`).

---

Partagé dans l'épisode 06 de « What the fuck is IA ».
