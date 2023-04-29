\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{heig-tb}[2020/06/23 HEIG-VD Bachelor Thesis]

\LoadClass[11pt,a4paper,twoside,final]{book}

\def\builddir{build}
\def\graphicsExt{pdf}
\def\assetsdir{\builddir/assets/figures}
\def\assetsdirnotbuilded{./assets/figures}

\RequirePackage[T1]{fontenc}
\RequirePackage[main=french,english]{babel}

%% Confidentiel
\DeclareOption{confidential}{
  \def\@confidential{Confidentiel}
}

%% Instituts
\DeclareOption{iide}{
  \def\instituteacronym{IIDE}
  \def\institutename{Institut Interdisciplinaire du Développement de l'Entreprise}
}

\DeclareOption{reds}{
  \def\instituteacronym{REDS}
  \def\institutename{Reconfigurable \& Embedded Digital Systems}
}

\DeclareOption{iai}{
  \def\instituteacronym{IAI}
  \def\institutename{Institut d'Automatisation Industrielle}
}

\DeclareOption{igt}{
  \def\instituteacronym{IGT}
  \def\institutename{Institut de Génie Thermique}
}

\DeclareOption{mei}{
  \def\instituteacronym{MEI}
  \def\institutename{Media Engineering Institute}
}

\DeclareOption{iict}{
  \def\instituteacronym{IICT}
  \def\institutename{Institut des Technologies de l'information et de la Communication}
}

\DeclareOption{insit}{
  \def\instituteacronym{INSIT}
  \def\institutename{Institut d'ingénierie du territoire}
}

\DeclareOption{iese}{
  \def\instituteacronym{IESE}
  \def\institutename{Institut d'Énergie et Systèmes Électroniques}
}

\DeclareOption{comatec}{
  \def\instituteacronym{COMATEC}
  \def\institutename{Institut de conception mécanique et technologie des matériaux}
}

%% Orientations
\DeclareOption{eai}{
  \def\@orientation{Électronique et Automatisation industrielle}
  \def\@department{TIN}
  \def\@faculty{Génie Électrique}
  \def\@field{Ingénierie}
}

\DeclareOption{eem}{
  \def\@orientation{Électronique embarquée et Mécatronique}
  \def\@department{TIN}
  \def\@faculty{Génie Électrique}
  \def\@field{Ingénierie}
}

\DeclareOption{en}{
  \def\@orientation{Systèmes énergétiques}
  \def\@department{TIN}
  \def\@faculty{Génie Électrique}
  \def\@field{Ingénierie}
}

\DeclareOption{eba}{
  \def\@orientation{Energétique du bâtiment}
  \def\@department{TIN}
  \def\@faculty{Energie et techniques environnementales}
  \def\@field{Ingénierie}
}

\DeclareOption{thi}{
  \def\@orientation{Thermique industrielle}
  \def\@department{TIN}
  \def\@faculty{Energie et techniques environnementales}
  \def\@field{Ingénierie}
}

\DeclareOption{tho}{
  \def\@orientation{Thermotronique}
  \def\@department{TIN}
  \def\@faculty{Energie et techniques environnementales}
  \def\@field{Ingénierie}
}

\DeclareOption{mi}{
  \def\@orientation{Mécatronique}
  \def\@department{TIN}
  \def\@faculty{Microtechniques}
  \def\@field{Ingénierie}
}

\DeclareOption{gen}{
  \def\@orientation{Génie de l'environnement}
  \def\@department{EC+G}
  \def\@faculty{Géomatique}
  \def\@field{Ingénierie}
}

\DeclareOption{ggt}{
  \def\@orientation{Géomatique et gestion du territoire}
  \def\@department{EC+G}
  \def\@faculty{Géomatique}
  \def\@field{Ingénierie}
}

\DeclareOption{gci}{
  \def\@orientation{Construction et infrastructures}
  \def\@department{EC+G}
  \def\@faculty{Géomatique}
  \def\@field{Ingénierie}
}

\DeclareOption{ie}{
  \def\@orientation{Systèmes informatiques embarqués}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{il}{
  \def\@orientation{Informatique logicielle}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{tr}{
  \def\@orientation{Réseaux et systèmes}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{id}{
  \def\@orientation{Ingénierie des données}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{ts}{
  \def\@orientation{Sécurité informatique}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{ee}{
  \def\@orientation{}
  \def\@department{HEG}
  \def\@faculty{Économie d'entreprise}
  \def\@field{Économie d'entreprise}
}

\DeclareOption{igi}{
  \def\@orientation{Qualité et performance industrrielles}
  \def\@department{TIN}
  \def\@faculty{Ingénierie et gestion industrielles}
  \def\@field{Ingénierie}
}
\ProcessOptions


\RequirePackage[fleqn]{amsmath}
\RequirePackage[small,bf,textfont=it]{caption}
\RequirePackage{appendix}
\RequirePackage{cellspace}
\RequirePackage{color}
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{fmtcount}
\RequirePackage{framed}
\RequirePackage{glossaries}
\RequirePackage{graphicx}
\RequirePackage{lastpage}
\RequirePackage{lipsum}
\RequirePackage{listings}
\RequirePackage{lmodern}
\RequirePackage{makeidx}
\RequirePackage{mdframed}
\RequirePackage{morefloats}
\RequirePackage{multicol}
\RequirePackage{nomencl}
\RequirePackage{parskip}
\RequirePackage{rotating}
\RequirePackage{siunitx}
\RequirePackage{tabularx}
\RequirePackage{tikz}
\RequirePackage{makecell}
\RequirePackage{bold-extra}
\RequirePackage{ifthen}
\RequirePackage{expkv-cs}
\RequirePackage[outputdir=build,chapter]{minted}

\RequirePackage[
  backref=true,
  backend=biber,
  style=alphabetic,
  sorting=ynt
  ]{biblatex}

\RequirePackage[
  a4paper,
  top=2.5cm,
  bottom=2.5cm,
  left=3cm,
  right=4cm,
  headheight=6mm,
  headsep=5mm,
  marginparwidth=3cm,
  marginparsep=4mm,
  heightrounded,
  includehead]{geometry}

\definecolor{linkcolor}{RGB}{219, 48, 122}
\RequirePackage[
  colorlinks=true,
  plainpages=true,
  linkcolor=black,
  citecolor=black,
  plainpages=false,
  unicode=true,
  urlcolor=linkcolor]{hyperref}

\RequirePackage{csquotes}

\usetikzlibrary{babel}
\usemintedstyle{colorful}
\setminted{frame=single,fontsize=\footnotesize}

\newcommand{\clearemptydoublepage}{%
	\newpage{\thispagestyle{empty}\cleardoublepage}}

\def\cleardoublepage{\clearpage\ifodd\c@page\else
  \null\thispagestyle{empty}\newpage\fi}

\setlength{\parindent}{0pt}
\setlength\parskip{\medskipamount}

%% Configuration de listings (minted est néanmoins préféré)
\lstset{%
language=C, % Vous pouvez choisir le langage de votre choix
breaklines=true,
breakatwhitespace=false,
basicstyle=\footnotesize\sffamily}

%% Settings
\def\subtitle#1{\def\@subtitle{#1}}
\def\teacher#1{\def\@teacher{#1}}
\def\genre#1{\def\@genre{#1}}
\def\field#1{\def\@field{#1}}
\def\genre#1{\def\@genre{#1}}
\def\female{female}
\def\signature#1{\def\@signature{#1}}

\def\printsignature{\includegraphics[width=4cm]{
  \assetsdir/\@signature.\graphicsExt}
}

\def\thesis#1{\def\@thesis{#1}}
\def\endyear#1{\def\@endyear{#1}}

%% Première page de couverture
\renewcommand\maketitle{%
\pagenumbering{empty}
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
  \node[anchor=north west,yshift=-2cm,xshift=2cm]%
      at (current page.north west)
      {\includegraphics[height=2cm]{assets/logos/heig-vd-baseline.pdf}};
  \node[anchor=south east,yshift=1.5cm,xshift=-1.5cm]%
      at (current page.south east)
      {\includegraphics[height=1cm]{assets/logos/hes-so.pdf}};
\end{tikzpicture}
\vspace{4cm}
\begin{center}%
\reset@font
\sffamily
{\usefont{T1}{lmss}{bx}{n}\huge\selectfont\@title\\\vspace{0.5em}
\large{\@subtitle}\par}%
\ifdefined\@confidential
\vskip 5em%
\textbf{\MakeUppercase{\@confidential}}
\vskip 5em%
\else
\vskip 10em%
\fi
Département \@department\par
Filière \@faculty\par
Orientation \@orientation
{\large
\vskip 5em%
\begin{tabular}[t]{c}%
\@author%
\end{tabular}\par}%
\vskip 1em%
{\large \@date}%
\vskip 4cm%
Supervisé par :\\
\@teacher\\
\end{center}%
\par%
\vskip 1.5em%
}

% Preamble
\newcommand{\preamblename}{Préambule}
\newcommand\preamble{
\chapter*{\preamblename}
\addcontentsline{toc}{chapter}{\preamblename}

Ce travail de Bachelor (ci-après \textbf{TB}) est réalisé en fin de cursus d'études, en vue de l'obtention du titre de Bachelor of Science HES-SO en \@field.

En tant que travail académique, son contenu, sans préjuger de sa valeur, n'engage ni la responsabilité de l'auteur, ni celles du jury du travail de Bachelor et de l'École.

Toute utilisation, même partielle, de ce TB doit être faite dans le respect du droit d'auteur.

\vskip 4em%
{\leftskip8cm\relax
HEIG-VD \\
Le Chef du Département\par
\vfil
}
Yverdon-les-Bains, le \@date
}

% Abstract
\newcommand{\abstractname}{Version Abrégée}
\newenvironment{abstract}{
  \chapter*{\abstractname}
  \addcontentsline{toc}{chapter}{\abstractname}
}

% Authentification
\newcommand{\authenticiationname}{Authentification}
\newcommand{\authentification}{
\chapter*{\authenticiationname}
\addcontentsline{toc}{chapter}{\authenticiationname}
Je soussigné\ifx\@genre\female e\fi, \@author, atteste par la présente avoir réalisé seul\ifx\@genre\female e\fi~ce travail et n'avoir utilisé aucune autre source que celles expressément mentionnées.
\vfil
{\leftskip9cm\relax\@author\par
\ifdefined\@signature
%\hspace{8cm}
\printsignature

\fi
}
\vfil
Yverdon-les-Bains, le \@date
}

% Annexes
\renewcommand\appendixpagename{Annexes}

\renewcommand\listoflistingscaption{Liste des codes sources}
\renewcommand{\nomname}{Liste des Symboles}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \ifdefined\@confidential
  \fancyfoot[LE]{\MakeUppercase{\@confidential}}
  \fancyfoot[RO]{\MakeUppercase{\@confidential}}
  \fi
}

\fancypagestyle{headings}{
\fancyhf{}
\fancyhead[LO]{\textsl{\rightmark}}
\fancyhead[RE]{\textsl{\leftmark}}
\ifdefined\@confidential
\fancyfoot[LE]{\MakeUppercase{\@confidential}}
\fancyfoot[RO]{\MakeUppercase{\@confidential}}
\fi
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}

\pagestyle{headings}


\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-2.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.0ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\itshape}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-2.5ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\large\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-2.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries\itshape}}

%% Marginal Note
\newcommand\maraja[1]{%
  \mbox{}%
  \marginpar{\raggedright \tiny#1}%
  \ignorespaces
}

%% Figure macros
\newcommand\fig[2][]{\fig@kv{short={#2},#1}{#2}}
\ekvcSplitAndForward\fig@kv\fig@out
  {
    % defaults here
     short = {}% will get set for each call to match the caption argument
    ,internal-label = {} % empty, not for direct use (easier that way)
    ,place = tbp
    ,...
  }
\ekvcSecondaryKeys\fig@kv
  {
     nmeta H = place=H % shortcut
    ,meta label = internal-label=\label{#1} % wraps \label around the value
    % add more keys you want to be handled special here
  }
\newcommand\fig@out[6]
  {%
    \begin{figure}[#3]
      \centering
      \includegraphics[#4]{\assetsdir/#6}%
      \caption[{#1}]{#5#2}%
      \label{#6}
    \end{figure}%
  }

%% Asterism
\newcommand{\asterism}{\vspace{1em}
\hfill\smash{%
    \raisebox{-.5ex}{%
      \setlength{\tabcolsep}{-.5pt}%
      \begin{tabular}{@{}cc@{}}%
        \multicolumn2c*\\[-2ex]*&*%
      \end{tabular}}}\hfill\vspace{1em}}

%% Locutions
\def\pex{p.~ex.~}
\def\cad{c.-à-d.~}
\def\cf{cf.~}

%% Keystroke command
\usetikzlibrary{shadows}

\newcommand*\keystroke[1]{%
  \tikz[baseline=(key.base)]
    \node[%
      draw,
      fill=white,
      drop shadow={shadow xshift=0.2ex,shadow yshift=-0.2ex,fill=black,opacity=0.55},
      rectangle,
      rounded corners=2pt,
      inner sep=2pt,
      line width=0.5pt,
      font=\scriptsize\sffamily
    ](key) {#1\strut}
  ;
}
