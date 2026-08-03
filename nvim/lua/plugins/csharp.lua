return {
  -- 1. Rejestracja ikonek dla plików .razor i .cshtml (mini.icons oraz nvim-web-devicons)

  -- {
  --   "nvim-mini/mini.icons",
  --   opts = {
  --     file = {
  --       [".razor"] = { glyph = "󰌛", hl = "MiniIconsPurple" },
  --       [".cshtml"] = { glyph = "󰌛", hl = "MiniIconsPurple" },
  --     },
  --     extension = {
  --       razor = { glyph = "󰌛", hl = "MiniIconsPurple" },
  --       cshtml = { glyph = "󰌛", hl = "MiniIconsPurple" },
  --     },
  --   },
  -- },

  {
    "nvim-mini/mini.icons",
    opts = {
      extension = {
        razor = { glyph = "󰌛", hl = "MiniIconsPurple" },
        cshtml = { glyph = "󰌛", hl = "MiniIconsPurple" },
      },
    },
  },

  {
    "nvim-tree/nvim-web-devicons",
    optional = true,
    opts = function(_, opts)
      opts.override = opts.override or {}
      opts.override.razor = { icon = "󰌛", color = "#512bd4", name = "Razor" }
      opts.override.cshtml = { icon = "󰌛", color = "#512bd4", name = "Razor" }
    end,
  },

  -- 2. Podpięcie HTML LSP pod pliki .razor (dla autosugestii tagów HTML)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {
          filetypes = { "html", "razor", "cshtml" },
        },
      },
    },
  },

  -- 4. Wymagane parser'y Treesitter (składnia C#, Razor i HTML)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c_sharp", "razor", "html" })
      end
    end,
  },

  -- 5. Roslyn LSP dla logiki C# w plikach .cs i .razor
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {},
  },
}

-- return {
--   -- 1. Ensure Treesitter parsers for C#, Razor, and HTML are installed
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function(_, opts)
--       if type(opts.ensure_installed) == "table" then
--         vim.list_extend(opts.ensure_installed, { "c_sharp", "razor", "html" })
--       end
--     end,
--   },
--
--   -- 2. Add roslyn.nvim to handle roslyn-language-server
--   {
--     "seblyng/roslyn.nvim",
--     ft = { "cs", "razor" },
--     opts = {
--       -- roslyn.nvim automatically looks for `roslyn-language-server` on your PATH.
--     },
--   },
--
--   -- 3. (Optional) Ensure Mason installs HTML language server for Blazor markup
--   {
--     "mason-org/mason.nvim",
--     opts = function(_, opts)
--       opts.ensure_installed = opts.ensure_installed or {}
--       vim.list_extend(opts.ensure_installed, { "html-lsp" })
--     end,
--   },
-- }
