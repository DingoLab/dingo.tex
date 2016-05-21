\ProvidesClass{dingo}[2016/05/03, Qinka<qinka@live.com>, Ver.0.1.0]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[oneside,UTF8]{ctexart}

%%% Toks
\newtoks\titlebgcolor %封面颜色
\newtoks\titlefontcolor % 封面字体颜色
\newtoks\coverpic %封面的图片
\newtoks\version %版本
\newtoks\city %地点


%%% CTeX
\ctexset
{ section =
  { beforeskip = 1em
  , afterskip  = 1em
  , number = \thesection
  , format = \songti\zihao{3}
  }
, subsection =
  { beforeskip = 1em
  , afterskiip = 1em
  , number = \thesubsection
  , format = \songti\zihao{4}
  }
, subsubsection =
  { beforeskip = 1em
  , afterskiip = 1em
  , number = \thesubsubsection
  , format = \songti\zihao{-4}
  }
}
%%% color
\RequirePackage{color}
\RequirePackage{xcolor}

%%% hyperref
\RequirePackage{hyperref}
\hypersetup{colorlinks,linkcolor=blue,anchorcolor=blue,citecolor=red,bookmarksnumbered,pdftitle=Dingo \@title}

%%% 时间
\RequirePackage{datetime}
\newdateformat{mydate}{\monthname[\THEMONTH],\THEYEAR}%
\newdateformat{mdydate}{\monthname[\THEMONTH] \ordinaldate{\THEDAY} \THEYEAR}%
\date{\mdydate\today}

%%% 代码列表
\RequirePackage{listings}
\newcounter{codeline}
\setcounter{codeline}{1}
\setcounter{lstnumber}{1}
%%% 定义颜色
\definecolor{codebg}{rgb}{1.00,0.90,1.00}
\definecolor{codekw}{rgb}{0.16,0.53,0.53}
\definecolor{codecm}{rgb}{0.00,0.00,0.00}
\definecolor{codens}{rgb}{0.00,0.00,0.00}
\definecolor{specbg}{rgb}{0.96,0.97,0.38}
\definecolor{speckw}{rgb}{0.16,0.53,0.53}
\definecolor{speccm}{rgb}{0.00,0.00,0.00}
\definecolor{specns}{rgb}{0.00,0.00,0.00}
%%% 定义代码环境
% code
\def\codestykw{\bfseries\color{codekw}}
\def\codestycm{\rmfamily\itshape\color{codecm}}
\def\codestyns{\tiny\color{codens}}
\lstnewenvironment{code}[1][]
{ \lstset
  { firstnumber=last
  , language=Haskell
  , breaklines
  , backgroundcolor=\color{codebg}
  , basicstyle=\sffamily
  , keywordstyle=\codestykw
  , commentstyle=\codestycm
  , flexiblecolumns
  , numbers=left
  , numberstyle=\codestyns
  , frame=trBL
  , #1
  }
}
{
  \setcounter{codeline}{\value{lstnumber}}
}
% spec
\def\specstykw{\bfseries\color{speckw}}
\def\specstycm{\rmfamily\itshape\color{speccm}}
\def\specstyns{\tiny\color{specns}}
\lstnewenvironment{spec}[1][]
{ \lstset
  { firstnumber=last
  , language=Haskell
  , breaklines
  , backgroundcolor=\color{specbg}
  , basicstyle=\sffamily
  , keywordstyle=\specstykw
  , commentstyle=\specstycm
  , flexiblecolumns
  , numbers=left
  , numberstyle=\specstyns
  , frame=trBL
  , #1
  }
}
{
  \setcounter{codeline}{1}
}
%  SQL
\lstnewenvironment{sql}[1][]
{ \lstset
    { firstnumber=last
    , language=SQL
    , breaklines
    , flexiblecolumns
    , numbers=left
    , frame=trBL
    , #1
    }
}
{
    \setcounter{lstnumber}{1}
}
\lstnewenvironment{shell}[1][]
{ \lstset
    { firstnumber=last
    , language=bash
    , breaklines
    , flexiblecolumns
    , numbers=left
    , frame=trBL
    , #1
    }
}
{
    \setcounter{lstnumber}{1}
}
\lstnewenvironment{json}[1][]
{ \lstset
    { firstnumber=last
%    , language=SQL
    , breaklines
    , flexiblecolumns
    , numbers=left
    , frame=trBL
    , #1
    }
}
{
    \setcounter{lstnumber}{1}
}
\lstnewenvironment{yaml}[1][]
{ \lstset
    { firstnumber=last
%    , language=SQL
    , breaklines
    , flexiblecolumns
    , numbers=left
    , frame=trBL
    , #1
    }
}
{
    \setcounter{lstnumber}{1}
}

%%% for LiterateHaskell
\long\def\ignore#1{\relax}

%%% 附录设置
\RequirePackage[titletoc]{appendix}
\renewcommand{\appendixname}{附录}
\renewcommand{\appendixpagename}{目录}
\appendixtitletocon

%%% 图片环绕
\RequirePackage{wrapfig}

\RequirePackage{graphicx}

%%% Caption
\RequirePackage{caption}


\RequirePackage{geometry}

\newcommand{\makecontent}{\begin{titlepage}%
	\label{page:contents}
	\pdfbookmark[1]{目录}{page:contents}
	\pagenumbering{roman}
	\tableofcontents
	\newpage
	\pagenumbering{arabic}
	\setcounter{page}{1}
\end{titlepage}
}
\newcommand{\makecover}{\begin{titlepage}%
    \pdfbookmark[0]{Dingo \@title}{}
    \pdfbookmark[1]{封面}{page:cover}
        \label{page:cover}
        \newgeometry{left=0em,right=0em,top=0em,bottom=0em}
            \vbox{\hfill\colorbox{\the\titlebgcolor}{\hbox to0.815\paperwidth{\Huge \color{\the\titlebgcolor}Dingo,Copyright (C) 2016 DingoLab}}}
            \vfill
            \begin{center}
                \includegraphics[width=0.6\paperwidth]{\the\coverpic}
            \end{center}
            \vfill\hfill
            \vspace{0.12\paperheight}\hbox{
            \colorbox{\the\titlebgcolor}{
                \vbox{\vspace{0.01\paperheight}\hbox to0.8\paperwidth{\hfil {\color{\the\titlefontcolor}\fontsize{90pt}{99pt}\selectfont Dingo\hspace*{0.05\paperwidth}}
                        \protect\vspace{0.6truemm}\relax}
                    \vspace{0.01\paperheight}
                    \hbox to0.81\paperwidth{\hfil \color{\the\titlefontcolor}{\Huge \@title \hspace*{0.05\paperwidth}}
                        \protect\vspace{0.6truemm}\relax}
                }
            }\hspace{-0.01\paperwidth}}
            \vspace{-0.12\paperheight}
            \vfill\hfill
            \vbox{
                \hbox to0.8\paperwidth{\hfil {\Huge DingoLab\hspace*{0.05\paperwidth}}
                    \protect\vspace{0.6truemm}\relax}
                \hbox to0.8\paperwidth{\hfil {\Large \mydate\today\, \hspace*{0.05\paperwidth}}
                    \protect\vspace{0.6truemm}\relax}
            }
            \vspace{0.06\paperwidth}
        \restoregeometry
    \newpage

    \pdfbookmark[1]{扉页}{page:title}
    % 扉页
    \label{page:title}
    \makeatletter
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \null\vfil
    \vskip 60\p@
    \begin{center}%
        {\Huge Dingo \@title \par}%
        \vskip 3em%
        {\large
            \lineskip .75em%
            \begin{tabular}[t]{c}%
                \@author
            \end{tabular}\par}%
        \vskip 1.5em%
        {\large \@date \par}%       % Set date in \large size.
    \end{center}\par
    \@thanks
    \vfil\null\setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax

    \makeatother
    \thispagestyle{empty}
    \vfill
    \begin{center}
        Version \the\version\\
        \the\city \\
        DingoLab
    \end{center}
    \end{titlepage}
    \newpage
}

\endinput
