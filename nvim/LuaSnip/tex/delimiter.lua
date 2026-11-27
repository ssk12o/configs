local tex = require("luasnip-helper")
local get_visual = tex.get_visual

-- Return snippet tables
return {
  -- LEFT/RIGHT PARENTHESES
  s(
    { trig = "([^%a])lpp", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\left(<>\\right)", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- LEFT/RIGHT SQUARE BRACES
  s(
    { trig = "([^%a])lbb", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\left[<>\\right]", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- LEFT/RIGHT CURLY BRACES
  s(
    { trig = "([^%a])lcc", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\left\\{<>\\right\\}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- BIG PARENTHESES
  s(
    { trig = "([^%a])bpp", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\big(<>\\big)", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- BIG SQUARE BRACES
  s(
    { trig = "([^%a])bbb", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\big[<>\\big]", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- BIG CURLY BRACES
  s(
    { trig = "([^%a])bcc", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\big\\{<>\\big\\}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- -- ESCAPED CURLY BRACES
  -- s(
  --   { trig = "([^%a])\\%{", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
  --   fmta("<>\\{<>\\}", {
  --     f(function(_, snip)
  --       return snip.captures[1]
  --     end),
  --     d(1, get_visual),
  --   })
  -- ),
  -- -- LATEX QUOTATION MARK
  -- s(
  --   { trig = "``", snippetType = "autosnippet" },
  --   fmta("``<>''", {
  --     d(1, get_visual),
  --   })
  -- ),
}
