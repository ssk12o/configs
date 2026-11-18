return {
  -- 1. Upewniamy się, że Mason ma dodany rejestr ze wsparciem dla Roslyna
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.registries = opts.registries or {}
      table.insert(opts.registries, "github:Crashdummyy/mason-registry")
      table.insert(opts.registries, "github:mason-org/mason-registry")
    end,
  },

  -- 2. Integracja z Roslyn LSP dla Neovima
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {
      -- Wtyczka automatycznie wykrywa roslyn / roslyn-nightly zainstalowane przez Masona
      config = {
        settings = {
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
          },
          ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c_sharp", "html", "css", "razor" })
      end
    end,
  },
}
