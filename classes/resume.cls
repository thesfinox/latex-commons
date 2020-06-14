\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2020/08/06 Column boxed resume]
\LoadClass{article}

%%%% BEGIN OPTIONS

%%%%%%%% PACKAGES

\RequirePackage[margin=0cm]{geometry} %------------ change aspect
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

%%%%%%%% COLOURS

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
\setlength{\parskip}{0em}
\setlength{\topskip}{0em}
\setlength{\baselineskip}{0em}

%%%%%%%% INFO COMMANDS

\makeatletter
    \newcommand*{\authorname}[1]{\def\@authorname{#1}} %-------------------------------------------- name
    \newcommand*{\authorsurname}[1]{\def\@authorsurname{#1}} %-------------------------------------- surname
    \newcommand{\name}{\@authorname}
    \newcommand{\surname}{\@authorsurname}

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

    \hypersetup %---------------------------------------------------------------------------------- update metadata
    {%
        pdftitle={\@title},
        pdfsubject={Curriculum Vitae},
        pdfauthor={\@author},
        pdfkeywords={curriculum vitae, resume, job, work, education, experience},
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

\newenvironment{cvname} % main heading with name and info
{%
    \vspace*{0.75em}
    \begin{center}
        \fontsize{32pt}{32pt}\selectfont
}
{%
    \end{center}
}

\newenvironment{cvcontact} % contact info
{%
    \begin{center}
        \small
}
{%
    \end{center}
}

\newenvironment{cvsocial} % social media info
{%
    \begin{center}
        \small
}
{%
    \end{center}
}

\makeatletter
    \newcommand{\cvtitle} % fill main heading with info (website, LinkedIN, Skype)
    {%
        \begin{cvname}
            \textcolor{name}{\name}~\textcolor{surname}{\MakeUppercase{\surname}}
        \end{cvname}

        \begin{cvcontact}
        \foreach \x in {\emaillink, \phonelink}
        {
            \ifthenelse{\isundefined{\x}}{}{\x~}
        }
        \end{cvcontact}

        \begin{cvsocial}
        \foreach \x in {\linkedinlink, \skypelink, \githublink}
        {
            \ifthenelse{\isundefined{\x}}{}{\x~}
        }
        \end{cvsocial}
        \vspace{-0.75em}
    }
\makeatother

%%%%%%%% SIDEBAR

\newenvironment{cvsidebar}
{%
    \begin{shaded}
}
{%
    \end{shaded}
}

%%%%%%%% SECTIONS

\newcommand{\cvsection}[1]
{%
    {%
        \Large
        \hspace{0.25em}
        \textcolor{bulletsection}{\rule{\textwidth}{2pt}}
        \par
        \hspace{0.25em}
        \textcolor{bulletsection}{\faBookmark}~
        \textcolor{section}{\MakeUppercase{#1}}
        \par
        \vspace{0.25em}
    }
}

%%%%%%%% ENTRIES

\newcommand{\cventry}[1]
{%
    {%
        \large
        \vspace{0.15em}
        \hspace{0.25em}
        \textbf{\MakeUppercase{#1}}
        \par
        \vspace{0.15em}
    }
}

\newcommand{\cvrole}[3]
{%
    \hspace{0.25em}
    \begin{tabular}[t]{@{}l|l@{}}
        \textcolor{period}{\ifthenelse{\equal{#2}{}}
                                      {\textbf{#1}}
                                      {\textbf{#1 - #2}}
                          }
        &
        \textcolor{position}{#3}
    \end{tabular}
    \par
    \vspace{0.35em}
}

\newcommand{\cvdesc}[1]
{%
    \hspace{0.5em}
    \begin{tabular}[t]{@{}|p{0.95\textwidth}@{}}
        \raggedright
        \textcolor{sidebardesc}{#1}
    \end{tabular}
    \par
    \vspace{0.35em}
}

\newenvironment{cvitemize}
{%
    \vspace{0.25em}
    \begin{itemize}[noitemsep, nolistsep]
        \raggedright
        \color{sectortext}
}
{%
    \end{itemize}
}

%%%%%%%% MAIN COLUMN

\newenvironment{cvmain}
{}
{}

\newenvironment{cvabout}
{%
    \begin{tabular}[t]{@{}|p{0.99\textwidth}@{}}
}
{%
    \end{tabular}
}

\newenvironment{cvmainsection}[1]
{%
    \mdfsetup
        {
            frametitle={\tikz[baseline=(current bounding box.east),outer sep=0pt]
                        \node[anchor=east,rectangle,fill=sector] {\large \textcolor{bulletsector}{\faArrowCircleORight}~\textcolor{sectortitle}{#1}};},
            innertopmargin=0.25em,
            rightmargin=1em,
            linecolor=sector,
            linewidth=2pt,
            topline=true,
            frametitleaboveskip=\dimexpr-\ht\strutbox\relax
        }
    \begin{mdframed}
}
{%
    \end{mdframed}
}

%%%%%%%% FOOTER

\newcommand{\cvgdpr}
{%
    {%
        \tiny
        \vspace*{-2em}
        I hereby authorise the use of my personal data in accordance to the GDPR 679/16 -- ``European regulation on the protection of personal data''.
    }
}

% vim: ft=tex
