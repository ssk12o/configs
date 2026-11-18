return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          -- Add cuda to the supported filetypes
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            -- Allow clangd to query nvcc and gcc for system include paths
            "--query-driver=/usr/bin/g++,/usr/bin/gcc,/opt/cuda/bin/nvcc",
          },
        },
      },
    },
  },
}
