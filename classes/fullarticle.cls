\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fullarticle}[2020/06/15 Article w/ Preloaded Packages]
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
\RequirePackage[type={CC},
                modifier={by-nc-nd},
                version={4.0}]{doclicense} %- licence
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

\setlength{\affilsep}{2em}
\renewcommand{\Authsep}{~,~}
\renewcommand{\Authand}{~~and~}
\renewcommand{\Authands}{~~and~}

\renewcommand*{\bibfont}{\small}

%---- metadata

\makeatletter
\hypersetup
{%
  pdftitle={\@title},
  breaklinks=true,
  linktocpage,
  colorlinks=true,
  urlcolor=blue,
  linkcolor=blue,
  citecolor=red
}
\makeatother

%---- title page

\renewcommand{\Affilfont}{\small}
\providecommand{\email}[1]{\href{mailto:#1}{\nolinkurl{#1}}}
\providecommand{\emailfoot}[1]{\thanks{e-mail:~\email{#1}}}
\providecommand{\arxivno}[1]{\href{http://arxiv.org/abs/#1}{\texttt{#1}}}
\providecommand{\doi}[1]{\href{\http://dx.doi.org/#1}{\nolinkurl{#1}}}

% vim: ft=tex
