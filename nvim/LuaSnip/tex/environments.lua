local tex = require("luasnip-helper")
local get_visual = tex.get_visual

return {
  s(
    { trig = "btw", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{twierdzenie}{<>}{tw:<>}
          <>
        \end{twierdzenie}
      ]],
      {
        i(1, "Tytul"),
        i(2, "label"),
        d(3, get_visual),
      }
    ),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "blem", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{lemat}{<>}{lem:<>}
          <>
        \end{lemat}
      ]],
      {
        i(1, "Tytul"),
        i(2, "label"),
        d(3, get_visual),
      }
    ),
    { condition = tex.line_begin }
  ),

  s(
    { trig = "bwn", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{wniosek}{<>}{wn:<>}
          <>
        \end{wniosek}
      ]],
      {
        i(1, "Tytul"),
        i(2, "label"),
        d(3, get_visual),
      }
    ),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "bdef", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{definicja}{<>}{def:<>}
          <>
        \end{definicja}
      ]],
      {
        i(1, "Tytul"),
        i(2, "label"),
        d(3, get_visual),
      }
    ),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "bprz", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{przyklad}{<>}{prz:<>}
          <>
        \end{przyklad}
      ]],
      {
        i(1, "Tytul"),
        i(2, "label"),
        d(3, get_visual),
      }
    ),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "balg", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{algorytm}{<>}{alg:<>}
          <>
        \end{algorytm}
      ]],
      {
        i(1, "Tytul"),
        i(2, "label"),
        d(3, get_visual),
      }
    ),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "buw", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{uwaga}{<>}{uw:<>}
          <>
        \end{uwaga}
      ]],
      {
        i(1, "Tytul"),
        i(2, "label"),
        d(3, get_visual),
      }
    ),
    { condition = tex.line_begin }
  ),

  s(
    { trig = "bit", snippetType = "autosnippet", dscr = "Lista itemize" },
    fmta(
      [[
        \begin{itemize}
          \item <>
        \end{itemize}
      ]],
      { d(1, get_visual) }
    ),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "ben", snippetType = "autosnippet", dscr = "Lista enumerate" },
    fmta(
      [[
        \begin{enumerate}
          \item <>
        \end{enumerate}
      ]],
      { d(1, get_visual) }
    ),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "it", snippetType = "autosnippet" },
    fmta("\\item <>", { d(1, get_visual) }),
    { condition = tex.line_begin }
  ),

  s({ trig = "ii", snippetType = "autosnippet" }, {
    t("\\item "),
  }, { condition = tex.line_begin }),

  -- Pełna templatka dokumentu (ręczny snippet pod <Tab> na początku linii)
  -- s(
  --   { trig = "templatka", dscr = "Pełna templatka dokumentu LaTeX" },
  --   fmta(
  --     [[
  --       \documentclass[a4paper,11pt]{article}
  --
  --       \def\motyw{storm}
  --
  --       % ---------- Kodowanie, język, czcionki ----------
  --       \usepackage[T1]{fontenc}
  --       \usepackage[utf8]{inputenc}
  --       \usepackage[polish]{babel}
  --       \usepackage{lmodern}
  --       \usepackage{microtype}
  -- % ---------- Układ strony ----------
  --       \usepackage[margin=3cm, marginparwidth=2.8cm]{geometry}
  --       \usepackage{marginnote}
  --       \renewcommand*{\marginfont}{\small\itshape}
  --       \usepackage{parskip}            % odstępy między akapitami zamiast wcięć
  --       \usepackage{fancyhdr}
  --       \usepackage{enumitem}
  --       \setlist{itemsep=2pt, topsep=4pt}
  --       \pagestyle{fancy}
  --       \fancyhf{}
  --       \fancyhead[L]{\sffamily\small <>}
  --       \fancyhead[R]{\sffamily\small\color{kolMu}\nouppercase{\leftmark}}
  --       \fancyfoot[C]{\sffamily\small\color{kolMu}\thepage}
  --       \renewcommand{\headrulewidth}{0.8pt}
  --       \renewcommand{\headrule}{\hbox to\headwidth{\color{kolTw}\leaders\hrule height \headrulewidth\hfill}}
  --
  --       % ---------- Matematyka ----------
  --       \usepackage{amsmath, amssymb, amsthm, mathtools}
  --       \usepackage{bm}
  --       \usepackage{stmaryrd}           % \llbracket, \rrbracket itp.
  --
  --       % Polskie zwyczaje typograficzne w matematyce
  --       \renewcommand{\le}{\leqslant}
  --       \renewcommand{\ge}{\geqslant}
  --       \renewcommand{\leq}{\leqslant}
  --       \renewcommand{\geq}{\geqslant}
  --       \renewcommand{\epsilon}{\varepsilon}
  --       \renewcommand{\phi}{\varphi}
  --       \renewcommand{\emptyset}{\varnothing}
  --       \renewcommand{\proofname}{Dowód}
  --
  --       % Polskie nazwy operatorów
  --       \DeclareMathOperator{\tg}{tg}
  --       \DeclareMathOperator{\ctg}{ctg}
  --       \DeclareMathOperator{\arctg}{arctg}
  --       \DeclareMathOperator{\sgn}{sgn}
  --       \DeclareMathOperator{\NWD}{NWD}
  --       \DeclareMathOperator{\NWW}{NWW}
  --
  --       % ---------- Tabele ----------
  --       \usepackage{booktabs}
  --       \usepackage{array}
  --       \usepackage{tabularx}
  --       \usepackage{multirow}
  --       \usepackage{makecell}
  --       \renewcommand{\arraystretch}{1.3}
  --       % nagłówek tabeli: \naglowek przed pierwszym wierszem
  --       \newcommand{\naglowek}{\rowcolor{kolBgH}}
  --       \newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
  --
  --       % ---------- Kolory i ramki ----------
  --       \usepackage[dvipsnames,svgnames,table]{xcolor}
  --       \usepackage{tikz}
  --       \usetikzlibrary{automata, arrows.meta, positioning, shapes.geometric, calc, fit, backgrounds}
  --       \usepackage[most]{tcolorbox}
  --       \tcbuselibrary{theorems, breakable, skins}
  --
  --       % ---------- Paleta zależna od motywu ----------
  --       \def\motywB{bialy}\def\motywT{tokyo}\def\motywS{storm}
  --       % Parametry ramek: \boxtint – intensywność tła wnętrza, \titletint – paska
  --       % tytułu, \titlemix – jasność koloru tytułu (100 = pełny kolor akcentu)
  --       \ifx\motyw\motywB
  --         \definecolor{kolBg}{HTML}{FFFFFF}   % tło strony
  --         \definecolor{kolBgD}{HTML}{FFFFFF}  % baza tła wnętrz ramek
  --         \definecolor{kolBgH}{HTML}{EEF2FF}  % podświetlenie (tytuł, tabele)
  --         \definecolor{kolTx}{HTML}{0F172A}   % tekst główny
  --         \definecolor{kolMu}{HTML}{64748B}   % tekst przyciszony
  --         \definecolor{kolSl}{HTML}{CBD5E1}   % linie
  --         \definecolor{kolTw}{HTML}{4F46E5}   % twierdzenie – indygo
  --         \definecolor{kolLe}{HTML}{0891B2}   % lemat – cyjan
  --         \definecolor{kolWn}{HTML}{9333EA}   % wniosek – fiolet
  --         \definecolor{kolDf}{HTML}{059669}   % definicja – szmaragd
  --         \definecolor{kolPr}{HTML}{EA580C}   % przykład – pomarańcz
  --         \definecolor{kolUw}{HTML}{64748B}   % uwaga – łupek
  --         \definecolor{kolAl}{HTML}{E11D48}   % algorytm – róż
  --         \def\boxtint{4}\def\titletint{14}\def\titlemix{70}
  --       \else\ifx\motyw\motywT
  --         \definecolor{kolBg}{HTML}{1A1B26}
  --         \definecolor{kolBgD}{HTML}{16161E}
  --         \definecolor{kolBgH}{HTML}{292E42}
  --         \definecolor{kolTx}{HTML}{C0CAF5}
  --         \definecolor{kolMu}{HTML}{7982A9}
  --         \definecolor{kolSl}{HTML}{414868}
  --         \definecolor{kolTw}{HTML}{7AA2F7}
  --         \definecolor{kolLe}{HTML}{7DCFFF}
  --         \definecolor{kolWn}{HTML}{BB9AF7}
  --         \definecolor{kolDf}{HTML}{9ECE6A}
  --         \definecolor{kolPr}{HTML}{FF9E64}
  --         \definecolor{kolUw}{HTML}{E0AF68}
  --         \definecolor{kolAl}{HTML}{F7768E}
  --         \def\boxtint{7}\def\titletint{20}\def\titlemix{100}
  --       \else\ifx\motyw\motywS
  --         \definecolor{kolBg}{HTML}{24283B}
  --         \definecolor{kolBgD}{HTML}{1F2335}
  --         \definecolor{kolBgH}{HTML}{2F3549}
  --         \definecolor{kolTx}{HTML}{C0CAF5}
  --         \definecolor{kolMu}{HTML}{7982A9}
  --         \definecolor{kolSl}{HTML}{414868}
  --         \definecolor{kolTw}{HTML}{7AA2F7}
  --         \definecolor{kolLe}{HTML}{7DCFFF}
  --         \definecolor{kolWn}{HTML}{BB9AF7}
  --         \definecolor{kolDf}{HTML}{9ECE6A}
  --         \definecolor{kolPr}{HTML}{FF9E64}
  --         \definecolor{kolUw}{HTML}{E0AF68}
  --         \definecolor{kolAl}{HTML}{F7768E}
  --         \def\boxtint{7}\def\titletint{20}\def\titlemix{100}
  --       \fi\fi\fi
  --
  --       \pagecolor{kolBg}
  --       \color{kolTx}
  --
  --       % Kolor linii w tabelach
  --       \arrayrulecolor{kolSl}
  --       \setlength{\heavyrulewidth}{1pt}
  --       \setlength{\lightrulewidth}{0.5pt}
  --
  --       % Wspólny styl: płaska ramka z grubym paskiem po lewej,
  --       % wnętrze w odcieniu tła, pasek tytułu lekko zabarwiony akcentem
  --       \tcbset{
  --         thmstyle/.style={
  --           enhanced, breakable, sharp corners, frame hidden, boxrule=0pt,
  --           titlerule=0pt, left=11pt, right=9pt, top=6pt, bottom=6pt,
  --           toptitle=3pt, bottomtitle=3pt, lefttitle=11pt,
  --           colupper=kolTx, fonttitle=\sffamily\bfseries\small,
  --           before skip=11pt, after skip=11pt,
  --         },
  --         thmcolor/.style={
  --           colback=#1!\boxtint!kolBgD, colbacktitle=#1!\titletint!kolBgD,
  --           coltitle=#1!\titlemix!black,
  --           borderline west={3.2pt}{0pt}{#1},
  --         }
  --       }
  --
  --       \newtcbtheorem[number within=section]{twierdzenie}{Twierdzenie}{
  --         thmstyle, thmcolor=kolTw,
  --         fontupper=\itshape}{tw}
  --
  --       \newtcbtheorem[use counter from=twierdzenie]{lemat}{Lemat}{
  --         thmstyle, thmcolor=kolLe,
  --         fontupper=\itshape}{le}
  --
  --       \newtcbtheorem[use counter from=twierdzenie]{wniosek}{Wniosek}{
  --         thmstyle, thmcolor=kolWn,
  --         fontupper=\itshape}{wn}
  --
  --       \newtcbtheorem[use counter from=twierdzenie]{definicja}{Definicja}{
  --         thmstyle, thmcolor=kolDf}{df}
  --
  --       \newtcbtheorem[use counter from=twierdzenie]{przyklad}{Przykład}{
  --         thmstyle, thmcolor=kolPr}{pr}
  --
  --       \newtcbtheorem[use counter from=twierdzenie]{algorytm}{Algorytm}{
  --         thmstyle, thmcolor=kolAl}{al}
  --
  --       \newtcbtheorem[no counter]{uwaga}{Uwaga}{
  --         thmstyle, thmcolor=kolUw}{uw}
  --
  --       \renewcommand{\qedsymbol}{$\blacksquare$}
  --
  --       % ---------- Nagłówki sekcji ----------
  --       \usepackage{titlesec}
  --       \titleformat{\section}[block]
  --         {\sffamily\bfseries\Large\color{kolTx}}
  --         {\color{kolTw}\thesection}{0.8em}{}[\vspace{0.1em}{\color{kolTw}\titlerule[1.2pt]}]
  --       \titleformat{\subsection}[block]
  --         {\sffamily\bfseries\large\color{kolTx}}
  --         {\color{kolTw}\thesubsection}{0.7em}{}
  --       \titlespacing*{\section}{0pt}{2.2ex plus .5ex}{1.4ex}
  --
  --       % Każda \section zaczyna się na nowej stronie
  --       \usepackage{etoolbox}
  --       \pretocmd{\section}{\clearpage}{}{}
  --
  --       % ---------- Hiperłącza (ładować na końcu) ----------
  --       \usepackage[colorlinks=true, linkcolor=kolTw, citecolor=kolDf, urlcolor=kolTw, bookmarksnumbered]{hyperref}
  --
  --       % Zbiory liczbowe
  --       \newcommand{\N}{\mathbb{N}}
  --       \newcommand{\Z}{\mathbb{Z}}
  --       \newcommand{\Q}{\mathbb{Q}}
  --       \newcommand{\R}{\mathbb{R}}
  --       \newcommand{\C}{\mathbb{C}}
  --
  --       \newcommand{\n}{\mathbb{N}}
  --       \newcommand{\z}{\mathbb{Z}}
  --       \newcommand{\q}{\mathbb{Q}}
  --
  --       % Stany w TikZ: styl automatów
  --       \tikzset{
  --         automat/.style={
  --           >={Stealth[round]}, shorten >=1pt, auto, node distance=2.4cm,
  --           semithick, initial text={}, draw=kolTx, text=kolTx,
  --           every state/.style={fill=kolBgH, draw=kolTw, text=kolTx, line width=0.9pt, minimum size=0.95cm},
  --           accepting/.style={fill=kolBgH, draw=kolDf},
  --         }
  --       }
  --
  --       % =====================================================================
  --
  --       \title{\textbf{<>}\\ \large <>}
  --       \author{Filip Sajko}
  --       \date{Data ostatniej kompilacji \today}
  --
  --       \begin{document}
  --       \maketitle{}
  --       \tableofcontents
  --       \bigskip
  --       % =====================================================================
  --
  --       <>
  --
  --       \end{document}
  --     ]],
  --     {
  --       i(1, "Title"),
  --       rep(1),
  --       i(2, "Subtitle"),
  --       i(0),
  --     }
  --   ),
  --   { condition = tex.line_begin }
  -- ),
}
