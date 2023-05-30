# Modèle HEIG-VD pour Rapport de Bachelor <!-- omit in toc -->

Ce référentiel contient un modèle de document LaTeX pour la production d'un rapport de Bachelor [HEIG-VD](http://heig-vd.ch). Il peut être adapté au besoin.

- [Contexte](#contexte)
- [Comment démarrer / Quick Start](#comment-démarrer--quick-start)
- [Utilisation](#utilisation)
- [VsCode + Docker + LaTeX Suite](#vscode--docker--latex-suite)
  - [Fork et Clone du référentiel](#fork-et-clone-du-référentiel)
  - [Demarrer vscode](#demarrer-vscode)
  - [Compiler](#compiler)
  - [Nettoyer la base de code](#nettoyer-la-base-de-code)
  - [Git ?](#git-)
- [Compilation](#compilation)
- [Prétraitement des figures](#prétraitement-des-figures)
- [Bibliographie](#bibliographie)
- [Glossaire](#glossaire)
- [Conventions typographiques et de style](#conventions-typographiques-et-de-style)
  - [Numérotation des pages](#numérotation-des-pages)
  - [Numérotation des éléments](#numérotation-des-éléments)
  - [Outils utiles](#outils-utiles)
  - [Conventions typographiques](#conventions-typographiques)
  - [Locutions](#locutions)
- [Technologies utilisées](#technologies-utilisées)
- [Standards](#standards)
- [Références](#références)
- [Aide et Support](#aide-et-support)

## Contexte

Cet environnement de repose pas sur [Overleaf](https://www.overleaf.com/) parce que la plateforme en ligne ne permet pas la gestion des dépendances et des artefacts et qu'elle est devenue payante avec le temps. Avec une solution en ligne les figures générées à partir de scripts (Python), les illustrations faites avec [draw.io](https://app.diagrams.net/) et la conversion de figures (`svg` en `pdf`), ne peut pas être automatisée.

Ce modèle de document se veut simple d'accès pour les étudiantes et les étudiants de la HEIG-VD. Il peut être adapté et est libre d'utilisation.

## Comment démarrer / Quick Start

Pour utiliser ce canevas, vous avez besoin des logiciels suivants:

- [Microsoft Visual Studio Code](https://code.visualstudio.com/)
- [Docker](https://www.docker.com/)

Une fois ces logiciels installés et démarrés, vous devez configurer une extension pour VS Code. Elle vous permettra de faire le lien avec Docker.

- [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

Il est suggéré d'utiliser WSL2 avec la distribution Ubuntu par soucis de facilité d'utilisation.

## Utilisation

L'environnement d'édition conseillé est l'éditeur [Microsoft Visual Studio Code](https://code.visualstudio.com/) couplé à [Docker](https://www.docker.com/) et au [Dev Containers](https://code.visualstudio.com/docs/remote/containers). Ceci vous évite d'installer une distribution LaTeX. Alternativement, il est possible de travailler dans [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

La distribution LaTeX conseillée est [TeX Live](https://www.tug.org/texlive/). L'alternative MiKTeX est déconseillée bien que très populaire.

## VsCode + Docker + LaTeX Suite

Certainement l'une des plus élégante manière de développer avec LaTeX est d'utiliser Visual Studio Code avec un container POSIX contenant une distribution TeXLive.

L'éditeur couplé à LaTeX Workshop de James Yu permet une éditition fluide. Le menu `commands` offre l'accès à tous les outils de base. La structure (en bas à gauche) et accessible par Ctrl+Alt+X permet de naviguer facilement dans le code. Le panneau des symboles (à droite) permet l'insertion facile de caractères mathématiques.

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

L'éditeur de PDF [Sumatra](https://www.sumatrapdfreader.org/) est conseillé pour visualiser votre rapport, contrairement à Adobe Acrobat, le contenu est automatiquement rafraichi une fois le rapport recompilé.

### Fork et Clone du référentiel

Pour bien démarrer, commencez par faire un *fork* du référentiel en cliquant sur le bouton **Fork** depuis l'interface GitHub. Ceci vous crée une copie du modèle dans votre propre organisation GitHub. Clonez ensuite le référentiel avec `git clone`.

### Demarrer vscode

Si vous n'avez pas installé VS code et Docker, vous devez les installer au préalable.

Démarrez vscode et installez l'extension *Visual Studio Code Remote - Containers*.

Ouvrez le dossier (`CTRL+K+O`), l'environnement de développement sera automatiquement démarré.

**NOTE:** La construction initiale du container prend beaucoup de temps car la distribution LaTeX doit être téléchargée. Vous pouvez aller boire un café.

### Compiler

Pour compiler le rapport exécutez simplement la commande `make`. Normalement, votre rapport est automatiquement compilé à chaque sauvegarde de vos modifications.

### Nettoyer la base de code

Pour retirer tous les éléments informatifs du modèle exécutez `make fresh`. La commande va éditer `report.tex` pour y retirer les textes d'information marqués par `%%if..%%fi`. La commande magique est :

```bash
find . -name '*.tex' -print0 | xargs -n1 -0 perl -0777 -pi -e "s/\%\%if.+?\%\%fi//gs"
```

### Git ?

Pour gérer le suivi de version de votre rédaction, vous pouvez utiliser Git intégré à VisualSudio Code. L'hébergement sur GitHub couplé à l'intégration continue permet la compilation automatique de votre rapport à chaque `git push`. Vous recevrez un e-mail en cas de problème de compilation. Le PDF sera quant à lui disponible depuis le panneau des artefacts de GitHub Actions.

## Compilation

Ce modèle de document est prévu pour fonctionner avec XeTeX pour la production d'un fichier `.pdf`. L'outil `latexmk` est utilisé pour séquencer la production du document final. Un `Makefile` s'occupe du prétraitement des figures.

XeTeX permet de directement lire les documents encodés en UTF-8 et supporte par conséquent l'Unicode et les polices de caractères TrueType et OpenType nativement.

## Prétraitement des figures

Les figures sont placées dans `assets/figures`.

Les figures au format `.svg` sont converties en `.svg.pdf` en utilisant `inkscape`.

Les figures au format `.drawio` sont converties en `.drawio.pdf` en utilisant la version desktop de `drawio`.

Les figures au format `.py` sont générées à l'aide de Python.

Pour chacun de ces formats un exemple est donné. L'utilisateur final est libre de modifier la logique de production de ces fichiers et d'en ajouter selon ses besoins.

Les conventions de nommage des fichiers intermédiaires sont les suivantes :

| Type                   | Source    | Destination   |
| ---------------------- | --------- | ------------- |
| Figure vectorielle svg | `.svg`    | `.svg.pdf`    |
| Diagramme draw.io      | `.drawio` | `.drawio.pdf` |
| Figure Python          | `.py`     | `.py.pdf`     |

## Bibliographie

Les entrées de bibliographie sont directement éditées dans `bibliography.bib`.

## Glossaire

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
8. Liste des abbreviations *optionnel*
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

- La première et dernière page de couverture ne sont pas numérotées
- Les pages vide ne sont pas numérotées
- Les pages précédant le premier chapitre du document sont numérotées en chiffres romains.
- Les pages à partir du premier chapitre du document sont numérotées en chiffres indo-arabes.

### Numérotation des éléments

- Les tables et les figures sont numérotées selon la convention `chapitre.id` où chapitre est le numéro courant du chapitre et `id` un compteur redémarré à `1` à chaque nouveau chapitre.

### Outils utiles

- Éditeur d'équation en ligne [latex3technics](https://www.latex4technics.com/)
- Éditeur de diagrammes en ligne [draw.io](https://app.diagrams.net/)
- Éditeur de tables pour LaTeX [tablegenerator](https://www.tablesgenerator.com/)
- Éditeur LaTeX en ligne [overleaf](https://www.overleaf.com/)
- Correcteur orthographique compatible LaTeX : [Druide Antidote](https://www.antidote.info/en/antidote-10)

### Conventions typographiques

- Les ligatures sont souhaitées.
- Les paragraphes sont soit indentés, soit espacés, mais pas les deux.
- Le premier paragraphe d'une section n'est jamais indenté.
- En français, les énumérations utilisent le [tiret demi-cadratin](https://fr.wikipedia.org/wiki/Tiret) (`U+2013`).
- Une énumération non ordonnée est considérée comme une phrase continue, chaque entrée sera ponctuée d'une virgule ou d'un point virgule.
- Une énumération ordonnée peut être constituée de phrase complètes.
- Les unités de mesure sont espacée de la grandeur associée par une [espace insécable](https://fr.wikipedia.org/wiki/Espace_ins%C3%A9cable) et ne sont pas en italique ni placées entres crochets.
- Les majuscules sont accentuées comme le recommande l'académie Française.
- Et cetera s'écrit `etc.` et est toujours précédé d'une virgule dans une énumération. La locution peut être remplacée par des points de suspension `...`. En aucun cas, ces deux formes sont combinées (`etc...`). Les points de suspension sont toujours collés dernier caractère d'une liste énumérée. (`a, b, c...`).
- Les mots étrangers ou les anglicismes sont placés en italique.

### Locutions

- La locution *confer* (voir ceci) est abrégée `cf.` (`\cf`)
- La locution *id est* (c'est à dire) est abrégée `c.-à-d.` et non `i.e.` (`\cad`)
- La locution *exempli gratia* (pour l'exemple) est abrégée `p. ex.` et non `e.g.` (`\pex`)

Les locutions latines non francisées suivantes seront écrites en italique :
*ad hoc*, *ad libitum*, *a fortiori*, *a posteriori*, *a posteriori*, *a priori*, *bis*, *grosso modo*, *ibidem*, *idem*, *in extenso*, *in extremis*, *in extenso*, *in extremis*, *in fine*, *infra*, *loc.cit.*, *modus vivendi*, *op.cit.*, *passim*, *quater*, *sic*, *statu quo*, *supra*, *ter*, *via*, *vice versa*.

## Release

Une release du rapport peut être générée en ajoutant en tag git après un commit.
```bash
git commit -am "Update rapport"
git tag v1.0.0 -m "Release v1.0.0"
git push origin --tags
```
Pour que github action puisse générer la release il faut donner les droits à github action de créer des releases. Dans les paramètres du repo sous Actions/General/Workflows Permissions, cocher "Read and write permission" puis save.


## Technologies utilisées

- [XeLaTeX](https://en.wikipedia.org/wiki/XeTeX) permet le support natif de l'Unicode dans la production de fichiers PDF.
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

## Références

- [Petites leçons de typographie](https://jacques-andre.fr/faqtypo/lessons.pdf) de Jaques André
- [Lexique des règles typographiques en usage à l’Imprimerie
nationale](https://www.payot.ch/Detail/lexique_des_regles_typographiques_en_usage_a_limprimerie_nationale-collectif-9782743304829) de l'Imprimerie Nationale française. ISBN 2-7433-0482-0

## Aide et Support

Pour toute question sur l'utilisation de ce modèle de document, veuillez créer une nouvelle [issue](https://github.com/heig-vd-tin/template-tb/issues), ou vous adresser à l'auteur du modèle Prof. Yves Chevallier.