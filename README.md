# Modèle HEIG-VD pour Rapport de Bachelor <!-- omit in toc -->

Ce référentiel contient le modèle de document LaTeX et Microsoft Word pour la production d'un rapport de Bachelor [HEIG-VD](http://heig-vd.ch).

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
- [Standards](#standards)
- [Références](#références)

## Utilisation

L'environnement d'édition conseillé est l'éditeur [Microsoft Visual Studio Code](https://code.visualstudio.com/) couplé à [Docker](https://www.docker.com/) et au [Dev Containers](https://code.visualstudio.com/docs/remote/containers). Ceci vous évite d'installer une distribution LaTeX. Alternativement, il est possible de travailler dans [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

La distribution LaTeX conseillée est [TeX Live](https://www.tug.org/texlive/). L'alternative MiKTeX est déconseillée.

## VsCode + Docker + LaTeX Suite

Certainement l'une des plus élégante manière de développer avec LaTeX est d'utiliser Visual Studio Code avec un container POSIX contenant une distribution TeXLive.

L'éditeur couplé à LaTeX Workshop de James Yu permet une éditition fluide. Le menu `commands` offre l'accès à tous les outils de base. La structure (en bas à gauche) permet de naviguer facilement dans le code. Le panneau des symboles (à droite) permet l'insertion facile de symbols.

![vscode](/assets/figures/editor.png)

Le fichier PDF peut être visualisé dans un navigateur Web sur un deuxième écran. SyncTeX permet de naviguer facilement de la prévisualisation au code source : Control + Clic dans le navigateur.

Vous pouvez utiliser les commandes suivantes suivi de tab:

| Commande | Font command  | Description                  |
| -------- | ------------- |
| FEM      | `\emph`       | Italiques                    |
| FTT      | `\textt`      | Caractères à espacement fixe |
| FSC      | `\textsc`     | Sans Serif                   |
| FUL      | `\underline`  | Souligné                     |
| FBF      | `\textbf`     | Gras                         |
| SSE      | `\section`    | Nouvelle section             |
| SSS      | `\subsection` | Nouvelle sous-section        |

D'autres commandes existent et sont accessibles [ici](https://cheatography.com/jcwinkler/cheat-sheets/latex-workshop-visual-studio-code/).

### Fork et Clone du référentiel

Commencez par faire un *fork* du référentiel en cliquant sur le bouton **Fork** depuis l'interface GitHub. Ceci vous crée une copie du modèle dans votre organisation GitHub. Clonez ensuite le référentiel avec `git clone`.

### Demarrer vscode

Si vous n'avez pas installé vscode et Docker, vous devez les installer au préalable.

Démarrez vscode et installez l'extension *Visual Studio Code Remote - Containers*.

Ouvrez le dossier (`CTRL+K+O`), l'environnement de développement sera automatiquement démarré.

**NOTE:** La construction initiale du container prend beaucoup de temps car la distribution LaTeX doit être téléchargée. Vous pouvez aller boire un café.

### Compiler

Pour compiler le rapport exécutez simplement la commande `make`.

### Nettoyer la base de code

Pour retirer tous les éléments informatifs du modèle exécutez `make fresh`. La commande va éditer `report.tex` pour y retirer les textes d'information.

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
8. Liste des abbréviations *optionnel*
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
| Abstract              | Version abbrégée       | Résumé                |
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
- Et cetera s'écrit `etc.` et est toujours précédé d'une virgule dans une énumération. La locultion peut être remplacée par des points de suspension `...`. En aucun cas, ces deux formes sont combinées (`etc...`). Les points de suspension sont toujours collés dernier caractère d'une liste énumérée. (`a, b, c...`).
- Les mots étrangés ou les anglicismes sont placés en italique.

### Locutions

- La locution *confer* (voir ceci) est abrégée `cf.` (`\cf`)
- La locution *id est* (c'est à dire) est abrégée `c.-à-d.` et non `i.e.` (`\cad`)
- La locution *exempli gratia* (pour l'exemple) est abrégée `p. ex.` et non `e.g.` (`\pex`)

Les locutions latines non francisées suivantes seront écrites en italique :
*ad hoc*, *ad libitum*, *a fortiori*, *a posteriori*, *a posteriori*, *a priori*, *bis*, *grosso modo*, *ibidem*, *idem*, *in extenso*, *in extremis*, *in extenso*, *in extremis*, *in fine*, *infra*, *loc.cit.*, *modus vivendi*, *op.cit.*, *passim*, *quater*, *sic*, *statu quo*, *supra*, *ter*, *via*, *vice versa*.

## Standards

- [Diagrammes BPMN 2.0](https://www.bpmn.org/) (*Business Process Model And Notation*)
- [Diagrammes UML 2.5.1](https://www.omg.org/spec/UML/About-UML/) (*Unified Modelling Language*)

## Références

- [Petites leçons de typographie](https://jacques-andre.fr/faqtypo/lessons.pdf) de Jaques André
- [Lexique des règles typographiques en usage à l’Imprimerie
nationale](https://www.payot.ch/Detail/lexique_des_regles_typographiques_en_usage_a_limprimerie_nationale-collectif-9782743304829) de l'Imprimerie Nationale française. ISBN 2-7433-0482-0
