local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s(
    { trig = "mytemplate", dscr = "Mój szablon dokumentu LaTeX" },
    fmta(
      [[
      \documentclass{article}
      \usepackage[utf8]{inputenc}
      \usepackage{amsmath, amssymb, amsthm}
      \usepackage{geometry}

      \title{<>}
      \author{<>}
      \date{\today}

      \begin{document}
      \maketitle

      <>

      \end{document}
      ]],
      {
        i(1, "Tytuł"),
        i(2, "Autor"),
        i(0),
      }
    )
  ),
}
