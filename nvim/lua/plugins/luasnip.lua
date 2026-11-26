return {
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    opts = {
      enable_autosnippets = true,
      cut_selection_keys = "<Tab>",
      update_events = { "TextChanged", "TextChangedI" },
    },
    config = function(_, opts)
      local ls = require("luasnip")
      local helpers = require("luasnip-helper")

      opts.snip_env = {
        ls = ls,
        in_mathzone = helpers.in_mathzone,
        not_in_mathzone = helpers.not_in_mathzone,
        get_visual = helpers.get_visual,
        in_text = helpers.in_text,
        line_begin_or_non_letter = helpers.line_begin_or_non_letter,
      }

      ls.setup(opts)
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/LuaSnip" },
      })
    end,
    keys = {
      {
        "<leader>cL",
        function()
          require("luasnip.loaders.from_lua").load({
            paths = { vim.fn.stdpath("config") .. "/LuaSnip" },
          })
          vim.notify("LuaSnip snippets reloaded!", vim.log.levels.INFO)
        end,
        desc = "Reload LuaSnip snippets",
      },
    },
  },
}
