local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

return {
  s(
    { trig = "snippet" },
    fmta(
      [[
            local tex = require("luasnip-helper")
            local get_visual = tex.get_visual
            local in_text = tex.in_text()
        ]],
      {}
    )
  ),
}
