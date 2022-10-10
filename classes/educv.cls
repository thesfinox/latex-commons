\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{educv}[2020/26/07 Academic CV]
\LoadClass{article}

%%%% BEGIN OPTIONS

%%%%%%%% PACKAGES

\RequirePackage[margin=1.25cm]{geometry} %------------ change aspect
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
\definecolor{links}{HTML}{006bb3}
\definecolor{sectiontitle}{gray}{0.40}
\definecolor{hlinecolor}{HTML}{0052cc}

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
    \newcommand*{\homepage}[1]{\def\@homepage{#1}} %---------------------------------------------- homepage info
    \newcommand{\homepagelink}{\faUser~
                               \href{https://\@homepage}{\@homepage}
                              } %------------------------------------------------------------------ link to homepage

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
        \foreach \x in {\linkedinlink, \skypelink, \githublink, \homepagelink}
        {
            \ifthenelse{\isundefined{\x}}{}{\x~}
        }
        \end{cvsocial}
    }
\makeatother

%%%%%%%% SECTIONS

\renewcommand{\section}[1]
{%
  \vspace{1em}
  {\Large \bf \textcolor{sectiontitle}{#1}}

  \textcolor{hlinecolor}{\rule{\textwidth}{3pt}}
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
