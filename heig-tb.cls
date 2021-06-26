\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{kepfl}[2020/06/23 HEIG-VD Bachelor Thesis]

\LoadClass[11pt,a4paper,twoside,final]{book}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[french,english]{babel}
\usepackage[fleqn]{amsmath}
\usepackage[small,bf,textfont=it]{caption}
\usepackage{appendix}
\usepackage{cellspace}
\usepackage{color}
\usepackage{fancyhdr}
\usepackage{nomencl}
\usepackage{float}
\usepackage{fmtcount}
\usepackage{framed}
\usepackage{glossaries}
\usepackage{graphicx}
\usepackage{lastpage}
\usepackage{lipsum}
\usepackage{listings}
\usepackage{lmodern}
\usepackage{makeidx}
\usepackage{morefloats}
\usepackage{multicol}
\usepackage{parskip}
\usepackage{rotating}
\usepackage{siunitx}
\usepackage{tabularx}
\usepackage{tikz}

\usepackage[
  backref=true,
  backend=biber,
  style=alphabetic,
  sorting=ynt
  ]{biblatex}

\usepackage[pdftex,
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

\usepackage[pdftex,
  colorlinks=true,
  plainpages=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=black]{hyperref}

\usetikzlibrary{babel}

\newcommand{\clearemptydoublepage}{%
	\newpage{\thispagestyle{empty}\cleardoublepage}}

\def\cleardoublepage{\clearpage\ifodd\c@page\else
  \null\thispagestyle{empty}\newpage\fi}

\setlength{\parindent}{0pt}
\setlength\parskip{\medskipamount}


%% Settings
\def\subtitle#1{\def\@subtitle{#1}}
\def\teacher#1{\def\@teacher{#1}}
\def\genre#1{\def\@genre{#1}}
\def\field#1{\def\@field{#1}}
\def\genre#1{\def\@genre{#1}}
\def\female{female}

\def\department#1{\def\@department{#1}}
\def\orientation#1{\def\@field{#1}}
\def\faculty#1{\def\@faculty{#1}}
\def\institute#1{\def\@institute{#1}}
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
\end{tikzpicture}
\begin{tikzpicture}[remember picture,overlay]
  \node[anchor=south east,yshift=1.5cm,xshift=-1.5cm]%
      at (current page.south east)
      {\includegraphics[height=1cm]{assets/logos/hes-so.pdf}};
\end{tikzpicture}
\vspace{4cm}
\begin{center}%
%\let \footnote \thanks
\reset@font
\sffamily
{\usefont{T1}{lmss}{bx}{n}\huge\selectfont\@title\\\vspace{0.5em}
\large{\@subtitle}\par}%
\vskip 10em%
Département \@department\par
\@faculty
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

% Acknowledgements
\newcommand\ackname{Remerciements}
\if@titlepage
  \newenvironment{acknowledgements}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \ackname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{acknowledgements}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \ackname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi

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
Je soussigné\ifx\@genre\female e\fi, \@author, atteste par la présente avoir réalisé seul\ifx\@genre\female e\fi ce travail et n’avoir utilisé aucune autre source que celles expressément mentionnées.
\vfil
{\leftskip9cm\relax\@author}
\vfil
Yverdon-les-Bains, le \@date
}


% Asterism
\newcommand{\asterism}{\vspace{1em}
\hfill\smash{%
    \raisebox{-.5ex}{%
      \setlength{\tabcolsep}{-.5pt}%
      \begin{tabular}{@{}cc@{}}%
        \multicolumn2c*\\[-2ex]*&*%
      \end{tabular}}}\hfill\vspace{1em}}


% Annexes
\renewcommand\appendixpagename{Annexes}

%\renewcommand{\nomname}{Liste des Symboles}

\fancypagestyle{headings}{
\fancyhf{}
\fancyhead[LO]{\textsl{\rightmark}}
\fancyhead[RE]{\textsl{\leftmark}}
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

%% Figures macros
\def\graphicsExt{pdf}
\newcommand{\figi}[3]{
   \begin{figure}[!h]
   \begin{center}
   \includegraphics[width=#2]{build/figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#3}
   \end{figure}
}

\newcommand{\figs}[2]{
   \begin{figure}[!ht]
   \begin{center}
   \includegraphics{build/figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}
}

\newcommand{\fig}[2]{
   \begin{figure}[!ht]
   \begin{center}
   \includegraphics[width=\textwidth]{build/figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}
}

\newcommand{\figc}[3]{
   \begin{figure}[!ht]
   \begin{center}
   \includegraphics[width=\textwidth]{build/figures/#1.\graphicsExt}
   \end{center}
   \caption[#2]{\label{#1}#3}
   \end{figure}
}

\newcommand{\figh}[2]{
   \begin{figure}[H]
   \begin{center}
   \includegraphics[width=\textwidth]{build/figures/#1.\graphicsExt}
   \end{center}
   \caption{\label{#1}#2}
   \end{figure}
}

%% Locutions
\def\pex{p.~ex.}
\def\cad{c.-à-d.}
