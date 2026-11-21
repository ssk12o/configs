return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_syntax_conceal_disable = 1
      -- Treat whichever .tex file you open as the main file
      vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
        pattern = "*.tex",
        callback = function(ev)
          vim.b[ev.buf].vimtex_main = vim.fn.fnamemodify(ev.file, ":p")
        end,
      })
    end,
  },
}
