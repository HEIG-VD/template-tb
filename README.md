# Modèle HEIG-VD pour Rapport de Bachelor <!-- omit in toc -->

Ce référentiel contient une proposition de modèle de document $\LaTeX{}$ pour la production d'un rapport de travail de bachelor [HEIG-VD](http://heig-vd.ch). Il peut être adapté au besoin.

![Preview](/assets/preview.png)

- [TL; DR;](#tl-dr)
- [Overleaf ?](#overleaf-)
- [Comment démarrer / Quick Start](#comment-démarrer--quick-start)
  - [Prérequis](#prérequis)
  - [Clone du projet](#clone-du-projet)
  - [Ouverture dans Visual Studio Code](#ouverture-dans-visual-studio-code)
  - [Configuration du titre et de la signature](#configuration-du-titre-et-de-la-signature)
  - [Nettoyage du modèle](#nettoyage-du-modèle)
- [Environnement de travail](#environnement-de-travail)
  - [VsCode + Docker + LaTeX Suite](#vscode--docker--latex-suite)
  - [Compilation](#compilation)
  - [Prétraitement des figures](#prétraitement-des-figures)
  - [Bibliographie](#bibliographie)
  - [Glossaire](#glossaire)
- [Conventions typographiques et de style](#conventions-typographiques-et-de-style)
  - [Numérotation des pages](#numérotation-des-pages)
  - [Numérotation des éléments](#numérotation-des-éléments)
  - [Conventions typographiques](#conventions-typographiques)
  - [Locutions](#locutions)
- [Outils utiles](#outils-utiles)
- [Release](#release)
- [Technologies utilisées](#technologies-utilisées)
- [Standards](#standards)
- [Autres modèles LaTeX](#autres-modèles-latex)
- [Aide et support](#aide-et-support)

## TL; DR;

- Utilisez [Visual Studio Code](https://code.visualstudio.com/) avec l'extension [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) pour éditer votre rapport.
- Clonez le référentiel et ouvrez le dossier dans VS Code.
- Compilez votre rapport avec `make`.
- Vous devez avoir [Docker](https://www.docker.com/) installé sur votre machine.
- Ce projet compile à la volée les diagrammes Draw.io, les figures SVG et les graphiques Python.

## Overleaf ?

Pourquoi ne pas offrir un modèle [Overleaf](https://www.overleaf.com/) ? D'une part parce que Overleaf n'est pas nécessairement gratuit et qu'il n'offre pas la possibilité de compiler des scripts Python ou des diagrammes Draw.io.

Éditer le rapport hors ligne semble plus adapté pour des raisons de confort d'utilisation, de confidentialité et de sécurité.

Avec le temps le support de Git/GitHub, et l'historique des changements ne sont plus disponibles dans la version gratuite d'Overleaf. Il est donc préférable de travailler en local et de pousser les modifications sur GitHub.

## Comment démarrer / Quick Start

### Prérequis

Pour utiliser ce canevas, vous avez besoin des logiciels suivants:

- [Microsoft Visual Studio Code](https://code.visualstudio.com/)
- [Docker](https://www.docker.com/)
- [Git](https://git-scm.com/)

Une fois ces logiciels installés et démarrés, vous devez configurer une extension pour VS Code. Elle vous permettra de faire le lien avec Docker.

- [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Clone du projet

Ensuite, vous pouvez cloner le référentiel sur votre machine en utilisant `git clone` ou GitHub Desktop, puis ouvrir le dossier dans VS Code.

Alternativement, et préférablement, vous pouvez faire un *fork* du référentiel sur GitHub, puis cloner votre copie sur votre machine. Ce faisant, vous pourrez pousser vos modifications sur votre propre copie du référentiel et surveiller les mises à jour du modèle original.

### Ouverture dans Visual Studio Code

Une fois le projet ouvert dans Visual Studio Code, l'extension *Remote - Containers* vous proposera de construire l'image Docker nécessaire à la compilation du document. Cette construction peut prendre du temps (2 à 15 minutes) selon votre connexion et votre machine.

Après cela la compilation est possible avec la commande `make` ou Ctrl+Alt+B.

### Configuration du titre et de la signature

Éditez le fichier `meta.tex` pour y inscrire le titre de votre rapport, votre nom et prénom et le nom de votre superviseur.

Remplacez ensuite la signature `assets/figures/signature.svg` par la vôtre. Il est préférable de garder une variante vectorielle, mais un fichier PNG peut également être utilisé.

### Nettoyage du modèle

Ce modèle est fourni avec des textes d'information. Supprimez simplement les fichiers superflus dans les répertoires suivants :

- `assets/frontmatter`
- `assets/content`
- `assets/backmatter`
- `assets/appendix`

Vous pouvez éventuellement garder la structure de `assets/content` et supprimer les textes d'information.

## Environnement de travail

### VsCode + Docker + LaTeX Suite

Certainement l'une des plus élégantes manières de développer avec $\LaTeX{}$ est d'utiliser Visual Studio Code avec un conteneur POSIX contenant une distribution TeXLive.

L'éditeur couplé à LaTeX Workshop de James Yu permet une édition fluide. Le menu `commands` offre l'accès à tous les outils de base. La structure (en bas à gauche) et accessible par Ctrl+Alt+X permet de naviguer facilement dans le code. Le panneau des symboles (à droite) permet l'insertion facile de caractères mathématiques.

![vscode](/assets/figures/editor.png)

Le fichier PDF peut être visualisé dans un navigateur Web sur un deuxième écran. SyncTeX permet de naviguer facilement de la prévisualisation au code source : Control + Clic dans le navigateur.

Vous pouvez utiliser les commandes suivantes suivi de tab:

| Commande | Font command  | Description                  |
| -------- | ------------- | ---------------------------- |
| FEM      | `\emph`       | Italiques                    |
| FTT      | `\textt`      | Caractères à espacement fixe |
| FSC      | `\textsc`     | Sans Serif                   |
| FUL      | `\underline`  | Souligné                     |
| FBF      | `\textbf`     | Gras                         |
| SSE      | `\section`    | Nouvelle section             |
| SSS      | `\subsection` | Nouvelle sous-section        |

D'autres commandes existent et sont accessibles [ici](https://cheatography.com/jcwinkler/cheat-sheets/latex-workshop-visual-studio-code/).

L'éditeur de PDF [Sumatra](https://www.sumatrapdfreader.org/) est conseillé pour visualiser votre rapport, contrairement à Adobe Acrobat, le contenu est automatiquement rafraichi une fois le rapport recompilé. Il est plus agréable à utiliser que la prévisualisation intégrée à VS Code, ou la visionneuse de PDF dans le navigateur.

### Compilation

Ce modèle de document est prévu pour fonctionner avec LuaLaTeX pour la production d'un fichier `.pdf`. L'outil `latexmk` est utilisé pour séquencer la production du document final. Un `Makefile` s'occupe du prétraitement des figures.

LuaLaTeX permet de directement lire les documents encodés en UTF-8 et supporte par conséquent l'Unicode et les polices de caractères TrueType et OpenType nativement.

### Prétraitement des figures

Les figures sont placées dans `assets/figures`.

Les figures au format `.svg` sont converties en `.svg.pdf` en utilisant `inkscape`.

Les figures au format `.drawio` sont converties en `.drawio.pdf` en utilisant la version desktop de `drawio`.

Les figures au format `.py` sont générées à l'aide de Python.

Pour chacun de ces formats, un exemple est donné. L'utilisateur final est libre de modifier la logique de production de ces fichiers et d'en ajouter selon ses besoins.

Les conventions de nommage des fichiers intermédiaires sont les suivantes :

| Type                   | Source    | Destination   |
| ---------------------- | --------- | ------------- |
| Figure vectorielle svg | `.svg`    | `.svg.pdf`    |
| Diagramme draw.io      | `.drawio` | `.drawio.pdf` |
| Figure Python          | `.py`     | `.py.pdf`     |

### Bibliographie

Les entrées de bibliographie sont directement éditées dans `bibliography.bib`.

### Glossaire

Le glossaire se trouve dans `glossary.tex`

## Conventions typographiques et de style

L'ordre conseillé pour le sommaire d'un rapport de Bachelor est le suivant:

1. Préambule
2. Authentification
3. Résumé (français)
4. Résumé (anglais) *optionnel*
5. Table des matières
6. Liste des figures
7. Liste des tables
8. Liste des abréviations *optionnel*
9. Liste des symboles *optionnel*
10. Liste des codes sources *optionnel*
11. Introduction
12. Conclusion
13. Glossaire *optionnel*
14. Bibliographie
15. Annexes *optionnel*
16. Index
17. Colophon *optionnel*

Les termes utilisés sont les suivants :

| Terminologie anglaise | Terminologie française | Alternative française |
| --------------------- | ---------------------- | --------------------- |
| Abstract              | Version abrégée        | Résumé                |
| Preamble              | Préambule              |                       |
| Authentication        | Authentification       |                       |
| Content               | Table des matières     | Sommaire              |
| Appendices            | Appendices             | Annexes               |
| Appendix              | Annexe                 |                       |

Les conventions consensuelles d'usage sont les suivantes :

### Numérotation des pages

- La première et dernière page de couverture n’est pas numérotée
- Les pages vides ne sont pas numérotées
- Les pages précédant le premier chapitre du document sont numérotées en chiffres romains.
- Les pages à partir du premier chapitre du document sont numérotées en chiffres indo-arabes.

### Numérotation des éléments

- Les tables et les figures sont numérotées selon la convention `chapitre.id` où chapitre est le numéro courant du chapitre et `id` un compteur redémarré à `1` à chaque nouveau chapitre.

### Conventions typographiques

- Les ligatures sont souhaitées.
- Les paragraphes sont soit indentés, soit espacés, mais pas les deux.
- Le premier paragraphe d'une section n'est jamais indenté.
- En français, les énumérations utilisent le [tiret demi-cadratin](https://fr.wikipedia.org/wiki/Tiret) (`U+2013`).
- Une énumération non ordonnée est considérée comme une phrase continue, chaque entrée sera ponctuée d'une virgule ou d'un point-virgule.
- Une énumération ordonnée peut être constituée de phrases complètes.
- Les unités de mesure sont espacées de la grandeur associée par une [espace insécable](https://fr.wikipedia.org/wiki/Espace_ins%C3%A9cable) et ne sont pas en italique ni placées entres crochets.
- Les majuscules sont accentuées comme le recommande l'Académie française.
- Et cetera s'écrit `etc.` et est toujours précédé d'une virgule dans une énumération. La locution peut être remplacée par des points de suspension `...`. En aucun cas, ces deux formes ne sont combinées (`etc...`). Les points de suspension sont toujours collés, dernier caractère d'une liste énumérée. (`a, b, c...`).
- Les mots étrangers ou les anglicismes sont placés en italique.

### Locutions

- La locution *confer* (voir ceci) est abrégée `cf.` (`\cf`)
- La locution *id est* (c'est-à-dire) est abrégée `c.-à-d.` et non `i.e.` (`\cad`)
- La locution *exempli gratia* (pour l'exemple) est abrégée `p. ex.` et non `e.g.` (`\pex`)

Les locutions latines non francisées suivantes seront écrites en italique :
*ad hoc*, *ad libitum*, *a fortiori*, *a posteriori*, *a posteriori*, *a priori*, *bis*, *grosso modo*, *ibidem*, *idem*, *in extenso*, *in extremis*, *in extenso*, *in extremis*, *in fine*, *infra*, *loc.cit.*, *modus vivendi*, *op.cit.*, *passim*, *quater*, *sic*, *statu quo*, *supra*, *ter*, *via*, *vice versa*.

## Outils utiles

- Éditeur d'équation en ligne [latex3technics](https://www.latex4technics.com/)
- Éditeur de diagrammes en ligne [draw.io](https://app.diagrams.net/)
- Éditeur de tables pour LaTeX [tablegenerator](https://www.tablesgenerator.com/)
- Éditeur LaTeX en ligne [overleaf](https://www.overleaf.com/)
- Correcteur orthographique compatible LaTeX : [Druide Antidote](https://www.antidote.info/en/antidote-10)

## Release

Une release du rapport peut être générée en ajoutant en tag git après un commit.
```bash
git commit -am "Update rapport"
git tag v1.0.0 -m "Release v1.0.0"
git push origin --tags
```
Pour que github action puisse générer la release il faut donner les droits à github action de créer des releases. Dans les paramètres du repo sous Actions/General/Workflows Permissions, cocher "Read and write permission" puis save.

## Technologies utilisées

- [LuaLateX](https://www.luatex.org/) permet le support natif de l'Unicode dans la production de fichiers PDF.
- [Inkscape](https://inkscape.org/) pour la conversion d'images SVG en PDF.
- [Draw.io](https://app.diagrams.net/) pour la conversion de diagrammes au format draw.io (XML) en PDF.
- [Python](https://www.python.org/) pour la génération de figures à partir d'une source de données brute, et la coloration syntaxique de code.
- [Make](https://www.gnu.org/software/make/) pour l'ordonnancement des étapes de compilation, et la gestion des dépendances.
- [TeX Live](https://www.tug.org/texlive/) est la distribution LaTeX la plus populaire, compatible avec Linux, Windows et macOS.
- [Visual Studio Code](https://code.visualstudio.com/) est un éditeur de code disposant d'extensions
  - [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) offre des raccourcis et des fonctionnalités additionnelles pour l'écriture de documents avec LaTeX sous VS Code.
  - [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) pour le suivi de versions au sein de l'éditeur
  - [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio) pour intégrer à VS Code l'éditeur de diagrammes Draw.io

## Standards

- [Diagrammes BPMN 2.0](https://www.bpmn.org/) (*Business Process Model And Notation*)
- [Diagrammes UML 2.5.1](https://www.omg.org/spec/UML/About-UML/) (*Unified Modelling Language*)

## Autres modèles LaTeX

- [EPFL unofficial PhD Thesis](https://github.com/glederrey/EPFL_thesis_template)
- [KaoBook de Jimmy Roussel](https://github.com/JimRou/template_kaobook)
- [Zurich University of Applied Sciences](https://github.com/matteodelucchi/ZHAW_thesis-template)
- [Université de la Sorbonne](https://github.com/itoumlilt/sorbonne-univ-cleanthesis)

## Aide et support

Pour toute question sur l'utilisation de ce modèle de document, veuillez créer une nouvelle [issue](https://github.com/heig-vd-tin/template-tb/issues), ou vous adresser à l'auteur du modèle Prof. Yves Chevallier.
