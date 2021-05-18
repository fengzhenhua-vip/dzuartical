%% 两个百分号是系统开户语法的识别标志
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3,l3keys2e,xparse,l3draw}
\GetIdInfo$Id: dzuartical.dtx v1.1.0 2021-05-10 21:42:29 +0800 Zhenhua Feng <fengzhenhua@outlook.com> $ {DeZhou University Thesis Proposal Class}
\ProvidesExplClass{dzuartical}{\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\PassOptionsToPackage{AutoFakeSlant = true , AutoFakeBold = true}{xeCJK} % 默认开启伪粗体,以方便使用宋体加粗
\LoadClass[a4paper,fontset=windows]{ctexart}
\ProcessOptions\relax
\RequirePackage{graphicx}
\RequirePackage[bottom=25.4mm,headheight=25.4mm,left=28.2mm,right=11.4mm]{geometry}
\tl_new:N\dz_title_tl
\tl_new:N\dz_teacher_tl
\tl_new:N\dz_author_tl
\tl_new:N\dz_id_tl
\tl_new:N\dz_major_tl
\tl_new:N\dz_unit_tl
\tl_new:N\dz_date_tl
\tl_new:N\dz_jie_tl
\tl_new:N\dz_number_tl
\tl_new:N \dz_songti_tl
\tl_set:Nn\dz_songti_tl{\bf\songti}  %定义宋体粗体
\dim_new:N\dz_head_dim
\dim_set:Nn\dz_head_dim{9cm}
\NewDocumentCommand \Title{m}{\tl_set:Nn \dz_title_tl{#1}}
\NewDocumentCommand \Teacher{m}{\tl_set:Nn \dz_teacher_tl{#1}}
\NewDocumentCommand \Author{m}{\tl_set:Nn \dz_author_tl{#1}}
\NewDocumentCommand \StudentID{m}{\tl_set:Nn \dz_id_tl{#1}}
\NewDocumentCommand \Major{m}{\tl_set:Nn \dz_major_tl{#1}}
\NewDocumentCommand \Unit{m}{\tl_set:Nn \dz_unit_tl{#1}}
\NewDocumentCommand \Number{m}{\tl_set:Nn\dz_number_tl{#1}}
\NewDocumentCommand \Date{ m m m }{\tl_set:Nn \dz_date_tl{\zhdigits{#1}年\zhdigits{#2}月\zhdigits{#3}日}\tl_set:Nn\dz_jie_tl{#1}}
\cs_new:Npn \dz_format:n #1 {\parbox{\dz_head_dim}{\centerline{\Large\raisebox{-8pt}{#1}}\rule[2pt]{\dz_head_dim}{0.4pt}}}
\RenewDocumentEnvironment{abstract}{o}
{
   \if@twocolumn
      \section*{\abstractname}%
   \else
      {\noindent\zihao{5}\bfseries 摘\quad{}要}
   \fi
}{}
\NewDocumentEnvironment{keywords}{o}
{\par\noindent{\zihao{5}\bfseries 关键字}}{\zihao{-4}}
\RenewDocumentCommand\maketitle{o}
{%
   \begin{titlepage}%
      \hfill  {\Large 编号：\dz_number_tl}%
      \vspace*{35pt}
      \begin{center}%
	\includegraphics[width=1.53cm]{校名校徽/de.png} 
	 \quad\qquad
	 \includegraphics[width=1.18cm]{校名校徽/zhou.png} 
	 \quad\qquad
	 \includegraphics[width=1.11cm]{校名校徽/xue.png} 
	 \quad\qquad
	 \includegraphics[width=1.17cm]{校名校徽/yuan.png} 
      \end{center}
      \vspace*{15pt}
      \begin{center}
	 \resizebox{!}{39pt}{\bf\songti 毕业论文(设计)}
      \end{center}
      \vspace{30pt}
      \begin{center}
%	 \includegraphics[scale=0.15]{校名校徽/dzulogo.eps}
	 \includegraphics[width=4.07cm]{校名校徽/logo.png}
      \end{center}
      \vspace{40pt}
      \begin{center}
	 {\Large 题\qquad 目}\qquad\dz_format:n {\dz_title_tl}\newline\newline%
	 {\Large 指导教师}\qquad \dz_format:n{\dz_teacher_tl}\newline\newline%
	 {\Large 学生姓名}\qquad \dz_format:n{\dz_author_tl}\newline\newline%
	 {\Large 学\qquad 号}\qquad \dz_format:n{\bf\songti\dz_id_tl}\newline\newline%
	 {\Large 专\qquad 业}\qquad \dz_format:n{\dz_major_tl}\newline\newline%
	 {\Large 教学单位}\qquad \dz_format:n{\dz_unit_tl}\makebox[0pt][r]{\Large(盖章)}\newline%
      \vspace*{20pt}
      \newline
      {\Large \dz_date_tl}
      \end{center}
   \end{titlepage}
   \let\footnotesize\small
   \let\footnoterule\relax
   \let \footnote \thanks
   \begin{center}%
      {\LARGE \@title \par}%
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
   \setcounter{footnote}{0}%
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
}
\ctexset{section/format += \raggedright} % 设置节的格式为左对齐

\tex_def:D\ns@oddfoot{\hfill\thepage\hfill}%
\tex_def:D\ns@oddhead{%
   \parbox{\textwidth}{\bf\songti 德州学院\hfill{}物理系\hfill\dz_jie_tl{}届\hfill{}\dz_major_tl{}专业\hfill{}毕业论文%
      \vspace*{-5pt}%
      \newline
      \rule[2pt]{\textwidth}{0.4pt}%
   }%
}
\tex_def:D\ns@evenhead{\thepage\hfill}
\tex_def:D\ps@dzuarticle{%
      \let\@oddhead\ns@oddhead%
      \let\@oddfoot\ns@oddfoot%
      \let\@evenhead\ns@evenhead%
      \let\@evenfoot\@oddfoot%
}%
\pagestyle{dzuarticle}
\title{\bf\dz_title_tl}
\author{\dz_author_tl}
\date{( \dz_unit_tl,山东德州 253023 )}
\endinput
