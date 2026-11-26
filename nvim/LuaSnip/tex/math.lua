local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Wykrywanie strefy matematycznej (wymaga pluginu VimTeX z extra lang.tex)
local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

-- Obsługa zaznaczenia z trybu Visual (zaznacz tekst -> <Tab> -> wpisz trigger)
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

return {
  -- Ręczny snippet pod <Tab>: środowisko LaTeX z powtarzaną nazwą (rep)
  s(
    { trig = "env", dscr = "Środowisko begin/end" },
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),

  -- Visual placeholder: zaznacz słowo, wciśnij <Tab>, wpisz tii i wciśnij <Tab>
  s({ trig = "tii", dscr = "Kursywa \\textit{}" }, fmta("\\textit{<>}", { d(1, get_visual) })),

  -- Autosnippet działający TYLKO w trybie matematycznym (np. wewnątrz $...$ lub equation)
  s({ trig = "ff", snippetType = "autosnippet", condition = in_mathzone }, fmta("\\frac{<>}{<>}", { i(1), i(2) })),

  -- Autosnippet dla litery greckiej (tylko w trybie matematycznym)
  s({ trig = ";a", snippetType = "autosnippet", condition = in_mathzone }, { t("\\alpha") }),
}
