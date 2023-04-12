\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coastal_paper}[2014/08/16 Example LaTeX class]

\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage{xcolor}
\definecolor{slcolor}{HTML}{882B21}
%\RequirePackage[default,scale=0.95]{opensans}

%\RequirePackage{authblk}
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt,letterpaper]{article}
\RequirePackage[margin=1.0in]{geometry}
%\RequirePackage[italic]{mathastext}
% \RequirePackage{isomath}
\RequirePackage{cmbright}
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath}
%\RequirePackage[onehalfspacing]{setspace}
\RequirePackage[doublespacing]{setspace}
\RequirePackage{authblk}
\renewcommand\Affilfont{\itshape\small}
\RequirePackage{natbib}
\setcitestyle{authoryear,open={(},close={)}}
\bibliographystyle{abbrvnat}
% \renewcommand{\maketitle}{%
%     \twocolumn[%
%         \fontsize{50}{60}\fontfamily{phv}\fontseries{b}%
%         \fontshape{sl}\selectfont\headlinecolor
%         \@title
%         \medskip
%         ]%
% }

\RequirePackage{titlesec}
\titleformat{\section}{\Large\sffamily\slshape}{\thesection}{0.2em}{}
\titleformat{\subsection}{\large\sffamily\slshape}{\thesubsection}{0.2em}{}

\providecommand{\keywords}[1]
{
 % \small	
  \underline{\textit{\large Keywords:}} #1
}

\RequirePackage{verbatim}

\newcommand{\detailtexcount}[1]{%
  \immediate\write18{texcount -merge -total -sum -q #1.tex output.bbl > #1.wcdetail }%
  \verbatiminput{#1.wcdetail}%
}
\newcommand{\quickwordcount}[1]{%
  \immediate\write18{texcount -1 -sum -merge -q #1.tex output.bbl > #1-words.sum }%
  \input{#1-words.sum} words%
}

%   -sum, -sum=   Make sum of all word and equation counts. May also use
%              -sum=#[,#] with up to 7 numbers to indicate how each of the
%              counts (text words, header words, caption words, #headers,
%              #floats, #inlined formulae, #displayed formulae) are summed.
%              The default sum (if only -sum is used) is the same as
%              -sum=1,1,1,0,0,1,1.


\newcommand{\quickcharcount}[1]{%
  \immediate\write18{texcount -1 -sum -merge -char -q #1.tex output.bbl > #1-chars.sum }%
  \input{#1-chars.sum} characters (not including spaces)%
}

% \renewcommand{\section}{%
%     \@startsection
%     {section}{1}{-0pt}{-1.5ex plus -2ex minus -.2ex}%
%     {1ex plus .2ex}{\large\sffamily\slshape}%
% %    {1ex plus .2ex}{\large\sffamily\slshape\headlinecolor}%
% }

% \renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
% \setlength{\textwidth}{17.5cm}
% \setlength{\textheight}{22cm}
% \setcounter{secnumdepth}{0}