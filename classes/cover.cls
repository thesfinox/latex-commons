\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cover}[2020/28/06 Cover letter template]
\LoadClass{article}

%%%% BEGIN OPTIONS

%%%%%%%% PACKAGES

\RequirePackage[margin=2cm]{geometry} %-------------- change aspect
\RequirePackage{graphicx} %-------------------------- figures and images
\RequirePackage{fontspec} %-------------------------- fonts in XeLaTex
\RequirePackage{enumitem} %-------------------------- control spacing of lists
\RequirePackage{fontawesome} %----------------------- icons and symbols
\RequirePackage{booktabs} %-------------------------- tables
\RequirePackage{multicol} %-------------------------- columns for tables
\RequirePackage{multirow} %-------------------------- rows for tables
\RequirePackage[usenames,dvipsnames]{xcolor} %------- colours
\RequirePackage[framemethod=TikZ]{mdframed} %-------- fancy frames
\RequirePackage{framed} %---------------------------- sidebar colour
\RequirePackage{ifthen} %---------------------------- conditionals
\RequirePackage{tikz} %------------------------------ foreach loops and diagrams
\RequirePackage{ragged2e} %-------------------------- improve alignment
\RequirePackage{bookmark} %-------------------------- hyperref

\renewcommand{\familydefault}{\sfdefault} %---------- default font w/o graces
\setsansfont{DejaVu Sans}

%%%%%%%% STYLE OF THE PAGE

\pagestyle{empty}

%%%%%%%% OPTIONS

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%%%% END OF OPTIONS

\ProcessOptions\relax

%%%% BEGIN DEFINITIONS

%%%% COLOURS

\definecolor{name}{gray}{0.40}
\definecolor{surname}{gray}{0.00}
\definecolor{shadecolor}{HTML}{fff2e6}
\definecolor{sidebardesc}{gray}{0.30}
\definecolor{links}{HTML}{006bb3}
\definecolor{section}{gray}{0.30}
\definecolor{bulletsection}{HTML}{cc0000}
\definecolor{period}{HTML}{cc0000}
\definecolor{position}{gray}{0.20}
\definecolor{sector}{HTML}{cc0000}
\definecolor{bulletsector}{gray}{0.95}
\definecolor{sectortext}{gray}{0.30}
\definecolor{sectortitle}{gray}{1.00}

%%%%%%%% CHARACTERISTIC SIZES

\setlength{\parindent}{0em}
\setlength{\parskip}{1em}
\setlength{\topskip}{0em}
\setlength{\baselineskip}{0em}

%%%%%%%% INFO COMMANDS

\makeatletter
    \newcommand*{\authorname}[1]{\def\@authorname{#1}} %-------------------------------------------- name
    \newcommand*{\authorsurname}[1]{\def\@authorsurname{#1}} %-------------------------------------- surname
    \newcommand{\name}{\@authorname}
    \newcommand{\surname}{\@authorsurname}
    \newcommand{\thedate}{\@date}

    \newcommand*{\skypename}[1]{\def\@skypename{#1}} %---------------------------------------------- Skype name
    \newcommand*{\skypeinvite}[1]{\def\@skypeinvite{#1}} %------------------------------------------ Skype invite link
    \newcommand{\skypelink}{\faSkype~
                            \ifthenelse{\isundefined{\@skypeinvite}}
                                       {\@skypename}
                                       {\href{\@skypeinvite}{\@skypename}}
                           } %--------------------------------------------------------------------- link to Skype

    \newcommand*{\github}[1]{\def\@github{#1}} %---------------------------------------------------- GitHub username
    \newcommand{\githublink}{\faGithub~
                             \href{https://www.github.com/\@github}
                                  {\@github}
                            } %-------------------------------------------------------------------- link to GitHub

    \newcommand*{\linkedin}[1]{\def\@linkedin{#1}} %----------------------------------------------- LinkedIn username
    \newcommand{\linkedinlink}{\faLinkedinSquare~
                               \href{https://www.linkedin.com/in/\@linkedin}
                                    {\@linkedin}
                              } %------------------------------------------------------------------ link to LinkedIn

    \newcommand*{\phone}[1]{\def\@phone{#1}} %----------------------------------------------------- phone contact info
    \newcommand{\phonelink}{\faMobile~
                            \href{tel:\@phone}{\@phone}
                           } %--------------------------------------------------------------------- link to phone

    \newcommand*{\email}[1]{\def\@email{#1}} %----------------------------------------------------- email contact info
    \newcommand{\emaillink}{\faAt~
                            \href{mailto:\@email}{\@email}
                           } %--------------------------------------------------------------------- link to mail

    \newcommand*{\address}[1]{\def\@address{#1}} %------------------------------------------------- address
    \newcommand{\addresslink}{\faInbox~
                              \@address
                             } %------------------------------------------------------------------- link to address

    \hypersetup %---------------------------------------------------------------------------------- update metadata
    {%
        pdftitle={\@title},
        pdfsubject={Cover letter},
        pdfauthor={\@author},
        pdfkeywords={cover letter, resume, job, work, education, experience},
        pdfstartview={FitH},
        pdfcreator={XeLaTeX},
        pdfproducer={XeLaTeX},
        pdflang={en-GB},
        pdfpagemode={UseOutlines},
        bookmarksopen={true},
        bookmarksnumbered={true},
        hidelinks,
        colorlinks=true,
        allcolors=links
    }
\makeatother

%%%%%%%% MAIN HEADING

\renewcommand{\maketitle}
{
  \begin{center}
  {
    \fontsize{32pt}{32pt}\selectfont
    \MakeUppercase{\name}~\MakeUppercase{\surname}
  }
  \\[1em]
  \emaillink~\phonelink
  \\[0.5em]
  \skypelink~\linkedinlink
  \\[0.5em]
  \addresslink
  \\
  \rule{0.75\textwidth}{2pt}
  \\[5em]
  \end{center}
}

\newenvironment{receiver}
{
  \begin{flushleft}
    \thedate
    \\[2em]
}
{
  \end{flushleft}
  \vspace{1em}
}

% vim: ft=tex
