local tex = require("luasnip-helper")
local get_visual = tex.get_visual

return {
  s(
    { trig = "lbl", snippetType = "autosnippet" },
    fmta(
      [[
      \label{<>}
      ]],
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    { trig = "url" },
    fmta([[\url{<>}]], {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "href", snippetType = "autosnippet" },
    fmta([[\href{<>}{<>}]], {
      i(1, "addres"),
      d(2, get_visual),
    })
  ),
  s(
    { trig = "hss", snippetType = "autosnippet" },
    fmta([[\hspace{<>}]], {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "vss", snippetType = "autosnippet" },
    fmta([[\vspace{<>}]], {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "h1", snippetType = "autosnippet" },
    fmta([[\section{<>}]], {
      d(1, get_visual),
    }),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "h2", snippetType = "autosnippet" },
    fmta([[\subsection{<>}]], {
      d(1, get_visual),
    }),
    { condition = tex.line_begin }
  ),
  s(
    { trig = "h3", snippetType = "autosnippet" },
    fmta([[\subsubsection{<>}]], {
      d(1, get_visual),
    }),
    { condition = tex.line_begin }
  ),
}
