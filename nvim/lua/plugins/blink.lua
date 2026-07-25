return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",

      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-l>"] = { "accept", "fallback" },

      ["<Tab>"] = { "select_next", "fallback" },
      ["<C-Tab>"] = { "select_prev", "fallback" },

      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<CR>"] = { "accept", "fallback" },
    },
    completion = {
      menu = {
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name" },
          },
        },
      },
      ghost_text = {
        enabled = true,
      },
    },
  },
}
