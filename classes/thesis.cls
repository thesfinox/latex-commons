\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2020/06/10 Book style thesis]
\LoadClass{article}

%---- packages

\RequirePackage[utf8]{inputenc} %--------------- support for UTF-8 characters
\RequirePackage[T1]{fontenc} %------------------ main fonts for pdfLaTeX
\RequirePackage{lmodern} %---------------------- better fonts
\RequirePackage{textcomp} %--------------------- companion fonts
\RequirePackage{geometry} %--------------------- manipulate page geometry
\RequirePackage{graphicx} %--------------------- pictures and figures
\RequirePackage{subcaption} %------------------- better captioning and subfigures
\RequirePackage{caption} %---------------------- better captions
\RequirePackage{enumitem} %--------------------- better item in enumerations
\RequirePackage{float} %------------------------ manage floating objects
\RequirePackage{xspace} %----------------------- insert correct space
\RequirePackage{xparse} %----------------------- improved \newcommand
\RequirePackage[multiple]{footmisc} %----------- better footer
\RequirePackage{marginnote} %------------------- use margin note in floats
\RequirePackage{booktabs} %--------------------- nice tables
\RequirePackage{makecell} %--------------------- custom cells in tabular
\RequirePackage{multicol} %--------------------- multi-column environment
\RequirePackage{multirow} %--------------------- multi-row environment
\RequirePackage{framed} %----------------------- better frames
\RequirePackage{mdframed} %--------------------- better frames
\RequirePackage{hyperref} %--------------------- load hyperref
\RequirePackage[all]{hypcap} %------------------ adjust anchor of captions
\RequirePackage[usenames,
                dvipsnames,
                svgnames,
                table]{xcolor} %---------------- colours
\RequirePackage{fancyhdr} %--------------------- fancy layout
\RequirePackage{authblk} %---------------------- manage multiple authors
\RequirePackage{setspace} %--------------------- set custom spacing
\RequirePackage{titlesec} %--------------------- custom title section
\RequirePackage{changepage} %------------------- change page layout
\RequirePackage{lastpage} %--------------------- reference to last page
\RequirePackage{tocloft} %---------------------- modify table of contents
\RequirePackage[type={CC},
                modifier={by-nc-nd},
                version={4.0}]{doclicense} %---- licence
\RequirePackage[nottoc]{tocbibind} %------------ put bibliography in TOC
\RequirePackage[backend=biber,
                citestyle=numeric-comp,
                sorting=none,
                sortcites=true,
                style=ieee,
                maxnames=3]{biblatex} %--------- bibliography backend
\RequirePackage{bookmark} %--------------------- hyperref and links

%---- pass options to class

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%---- end options

\ProcessOptions\relax

%---- numbers and style

\pagenumbering{arabic}
\pagestyle{fancy}

\titleformat{\part}
            [display]
            {\centering\normalfont\Huge\scshape}
            {\vfill
             \partname~\thepart}
            {0pt}
            {\vspace{3pt}
             \Huge
            }

%---- space

\newlength{\blockskip}
\setlength\blockskip{1em}

\newlength{\sepwidth}
\setlength\sepwidth{1pt}
\setlength\parskip{1em}

%---- table of contents

\setlength\cftbeforesubsecskip{5pt}

%---- metadata

\makeatletter

\providecommand*{\author}[1]{\def\@author{#1}}
\providecommand*{\title}[1]{\def\@title{#1}}
\providecommand*{\advisor}[1]{\def\@advisor{#1}}
\providecommand*{\institution}[1]{\def\@institution{#1}}
\providecommand*{\school}[1]{\def\@school{#1}}
\providecommand*{\specialisation}[1]{\def\@specialisation{#1}}
\providecommand*{\logo}[1]{\def\@logo{#1}}

\providecommand{\theauthor}{\@author}
\providecommand{\thetitle}{\@title}
\providecommand{\theadvisor}{\@advisor}
\providecommand{\theinstitution}{\@institution}
\providecommand{\thespecialisation}{\@specialisation}
\providecommand{\theschool}{\@school}
\providecommand{\thelogo}{\@logo}

\makeatother

\hypersetup
{%
  pdftitle={\thetitle},
  pdfsubject={Thesis},
  pdfkeywords={thesis, graduation, doctoral, phd},
  breaklinks=true,
  linktocpage,
  colorlinks=true,
  urlcolor=blue,
  linkcolor=blue,
  citecolor=red
}

%---- titlepage

\newcommand{\maketitlepage}
{%
  \thispagestyle{empty}

  \begin{center}
    {\Large \theinstitution} \\
    {\Large \bf \theschool} \\
  \end{center}

  \hrulefill

  \vspace{4\blockskip}

  \begin{center}
    \includegraphics[width=\textwidth]{\thelogo}
  \end{center}

  \vfill

  \begin{center}
    {\Large \bf \thetitle}
  \end{center}

  \vspace{4\blockskip}

  {\Large \bf \theauthor}
}

\newcommand{\makefrontespice}
{%
  \thispagestyle{plain}

  \begin{center}
    {\Large \theinstitution} \\
    {\Large \bf \theschool} \\
  \end{center}

  \hrulefill

  \begin{center}
    {\Large \bf \thespecialisation}
  \end{center}

  \vspace{8\blockskip}

  \begin{center}
    {\Large \bf \thetitle}
  \end{center}

  \vfill

  {\Large \bf \theauthor}

  \vspace{4\blockskip}

  {\Large \bf Advisor: \theadvisor}
}

\newcommand{\cleardoubleplainpage}
{%
  \clearpage{\thispagestyle{plain}\cleardoublepage}
}

\newcommand{\plaintoc}
{%
  \pagestyle{plain}
  \renewcommand*{\contentsname}{\Huge Table of Contents}
  \tableofcontents
  \cleardoubleplainpage{}
  \pagestyle{fancy}
}

%---- abstract

\newenvironment{abstractpage}
{%
  \thispagestyle{plain}

  \noindent {\Large \sc Abstract} \\
  \rule{0.99\linewidth}{\sepwidth}
}
{%
  \vfill
}

%---- acknowledgements

\newenvironment{acknowledgmentspage}
{%
  \thispagestyle{plain}

  \noindent {\Large \sc Acknowledgements} \\
  \rule{0.99\linewidth}{\sepwidth}
}
{%
  \vspace{\parskip}
  \theauthor
  \vfill
}

%---- part and sections

\newcommand{\thesispart}[1]
{%
  \cleardoubleplainpage{}
  \thispagestyle{plain}
  \part{#1}
  \vfill
  \cleardoubleplainpage{}
}

\newcommand{\outline}[1]
{%
  \thispagestyle{plain}
  \section*{#1}
  \addcontentsline{toc}{section}{#1}
}

% vim: ft=tex
