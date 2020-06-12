\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2020/06/10 Book style thesis]
\LoadClass{article}

%---- packages

\RequirePackage{geometry} %--------------------- manipulate page geometry
\RequirePackage{fontspec} %--------------------- alternative fonts
\RequirePackage{graphicx} %--------------------- pictures and figures
\RequirePackage{booktabs} %--------------------- nice tables
\RequirePackage{caption} %---------------------- better captions
\RequirePackage[usenames,dvipsnames]{xcolor} %-- colours
\RequirePackage{fancyhdr} %--------------------- fancy layout
\RequirePackage[nottoc]{tocbibind} %------------ put bibliography in TOC
\RequirePackage{titlesec} %--------------------- customise section and part
\RequirePackage[backend=biber,
                sorting=none,
                style=ieee,
                maxnames=3]{biblatex} %--------- bibliography backend
\RequirePackage{bookmark} %--------------------- hyperref and links
\RequirePackage[sort,english]{cleveref} %------- nicer citations and references

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
  pdfauthor={\theauthor},
  pdfkeywords={thesis, graduation, doctoral, phd},
  pdfstartview={FitH},
  pdfcreator={XeLaTeX},
  pdfproducer={XeLaTeX},
  pdflang={en-GB},
  pdfpagemode={UseOutlines},
  bookmarksopen={true},
  bookmarksnumbered={true},
  hidelinks,
  linktocpage,
  colorlinks={true},
  linkcolor={blue},
  urlcolor={blue},
  filecolor={blue},
  runcolor={blue},
  menucolor={blue},
  citecolor={red}
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

  {\Large \bf \thetitle}

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
  \thispagestyle{plain}
  \renewcommand*{\contentsname}{\Huge Table of Contents}
  \tableofcontents
  \cleardoubleplainpage{}
}

%---- abstract

\newenvironment{abstractpage}
{%
  \thispagestyle{plain}

  \noindent {\Large \sc Abstract} \\
  \rule{0.99\textwidth}{\sepwidth}
}
{%
  \vfill
}

%---- acknowledgements

\newenvironment{acknowledgementspage}
{%
  \thispagestyle{plain}

  \noindent {\Large \sc Acknowledgements} \\
  \rule{0.99\textwidth}{\sepwidth}
}
{%
  \vspace{\parskip}
  \raggedleft\theauthor
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
