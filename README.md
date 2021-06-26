# Modèle HEIG-VD pour Rapport de Bachelor

Ce référentiel contient le modèle de document pour la production d'un rapport de Bachelor HEIG-VD.

## Utilisation

## Compilation

Ce modèle de document est prévu pour fonctionner avec `xelatex` pour la production d'un fichier `.pdf`. L'outil `latexmk` est utilisé pour séquencer la production du document final. Un `Makefile` s'occupe du prétraitement des figures.

## Prétraitement des figures

Les figures au format `.pdf.svg` sont converties en `.pdf` en utilisant `inkscape`.

Les figures au format `.drawio.xml` sont converties en `.pdf` en utilisant la version desktop de `draw.io`.

Les figures au format `.pdf.py` sont générées à l'aide de Python.

Pour chacun de ces formats un exemple est donné. L'utilisateur final est libre de modifier la logique de production de ces fichiers et d'en ajouter selon ses besoins.

Les conventions de nommage des fichiers intermédiaires sont les suivantes :

| Type | Source | Destination |
|------|--------|-------------|
| Figure vectorielle svg | `.svg` | `.svg.pdf` |
| Diagramme draw.io | `.xml` | `.xml.pdf` |
| Figure Python | `.py` | `.py.pdf` |

## Bibliographie

