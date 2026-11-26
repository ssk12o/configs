return {
  "saghen/blink.cmp",
  optional = true,
  opts = function(_, opts)
    opts.snippets = { preset = "luasnip" }

    opts.keymap = opts.keymap or {}
    opts.keymap.preset = "super-tab"

    -- Zawsze automatycznie zaznaczaj najlepszą (pierwszą) opcję na liście
    opts.completion = opts.completion or {}
    opts.completion.list = opts.completion.list or {}
    opts.completion.list.selection = opts.completion.list.selection or {}
    opts.completion.list.selection.preselect = true

    opts.completion.list.selection.auto_insert = false

    opts.keymap["<C-j>"] = { "select_next", "fallback" }
    opts.keymap["<C-k>"] = { "select_prev", "fallback" }
    opts.keymap["<C-l>"] = { "select_and_accept", "fallback" }

    opts.keymap["<Tab>"] = {
      "select_and_accept",
      "snippet_forward",
      LazyVim.cmp.map({ "ai_nes", "ai_accept" }),
      "fallback",
    }

    opts.completion.ghost_text = { enabled = true }
    opts.completion.menu = opts.completion.menu or {}
    opts.completion.menu.draw = opts.completion.menu.draw or {}
    opts.completion.menu.draw.columns = {
      { "kind_icon" },
      { "label", "label_description", gap = 1 },
      { "kind" },
      { "source_name" },
    }

    opts.sources = opts.sources or {}
    opts.sources.providers = opts.sources.providers or {}
    opts.sources.providers.snippets = opts.sources.providers.snippets or {}
    opts.sources.providers.snippets.opts = opts.sources.providers.snippets.opts or {}
    opts.sources.providers.snippets.opts.show_autosnippets = false
  end,
}

-- return {
--   "saghen/blink.cmp",
--   opts = {
--     snippets = {
--       preset = "luasnip",
--     },
--     keymap = {
--       preset = "default",
--
--       ["<C-j>"] = { "select_next", "fallback" },
--       ["<C-k>"] = { "select_prev", "fallback" },
--       ["<C-l>"] = { "accept", "fallback" },
--
--       ["<Tab>"] = {
--         -- function(cmp)
--         --   local ls = require("luasnip")
--         --   if vim.api.nvim_get_mode().mode:sub(1, 1) == "i" and ls.expandable() then
--         --     if cmp.is_visible() then
--         --       cmp.hide()
--         --     end
--         --     vim.schedule(function()
--         --       ls.expand()
--         --     end)
--         --     return true
--         --   end
--         -- end,
--         "snippet_forward",
--         -- "accept",
--         "fallback",
--       },
--       ["<S-Tab>"] = { "snippet_backward", "fallback" },
--
--       ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
--       -- ["<CR>"] = { "accept", "fallback" },
--     },
--     completion = {
--       menu = {
--         draw = {
--           columns = {
--             { "kind_icon" },
--             { "label", "label_description", gap = 1 },
--             { "kind" },
--             { "source_name" },
--           },
--         },
--       },
--       ghost_text = {
--         enabled = true,
--       },
--     },
--   },
-- }
