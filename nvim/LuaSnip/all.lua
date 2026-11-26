local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
  s({ trig = "hi" }, { t("Hello, world!") }),
  s({ trig = "tst" }, { t("\\cmd{"), i(1, "domyslny"), t("}"), i(0) }),
}
