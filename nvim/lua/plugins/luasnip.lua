return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    opts = {
      enable_autosnippets = true,
      cut_selection_keys = "<Tab>",
      update_events = { "TextChanged", "TextChangedI" },
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
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
          vim.notify("LusSnip snippets reloaded!", vim.log.levels.INFO)
        end,
        desc = "Reload LuaSnip snippets",
      },
    },
  },
}
