\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{heig-tb}[2020/06/23 HEIG-VD Bachelor Thesis]

\LoadClass[11pt,a4paper,twoside,final]{book}

\def\builddir{build}
\def\graphicsExt{pdf}
\def\assetsdir{\builddir/assets/figures}
\def\assetsdirnotbuilded{./assets/figures}

\RequirePackage{fontspec}
\RequirePackage[main=french,english]{babel}

%% Confidentiel
\DeclareOption{confidential}{
  \def\@confidential{Confidentiel}
}

\input{meta/institutes.tex}
\input{meta/orientations.tex}

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
\RequirePackage{etoolbox}
\RequirePackage{framed}
\RequirePackage{glossaries}
\RequirePackage{graphicx}
\RequirePackage{lastpage}
\RequirePackage{lipsum}
\RequirePackage{listings}
\RequirePackage{microtype}
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
\RequirePackage{expkv-cs}
\RequirePackage[outputdir=build,chapter]{minted}

\setmainfont{Latin Modern Roman}

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

% Avoid \c@page warnings
\hypersetup{pdfpagelabels=false,bookmarksdepth=section}

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
    \node[anchor=north west,yshift=-1.5cm,xshift=1.5cm]%
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

% Abstract
\newcommand{\abstractname}{Version Abrégée}
\newenvironment{abstract}{
  \chapter*{\abstractname}
  \addcontentsline{toc}{chapter}{\abstractname}
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
        \multicolumn2c* \\[-2ex]*&*%
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

\makeatletter
\newcommand{\thedate}{\@date}
\newcommand{\thefield}{\@field}
\newcommand{\thegenre}{\@genre}
\newcommand{\theauthor}{\@author}
\newcommand{\thesignature}{\@signature}
\makeatother