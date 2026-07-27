-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Jump form insert mode to normal mode after typing twice...
vim.keymap.set("i", ";;", "<C-o>", { desc = "Normal mode single operation" })

-- Rebinding of hopping between buffers
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")

vim.keymap.set("n", "<C-j>", "]b", { remap = true, desc = "Next Buffer" })
vim.keymap.set("n", "<C-k>", "[b", { remap = true, desc = "Previous Buffer" })

-- vim.keymap.set("i", ";", function()
--   local line = vim.api.nvim_get_current_line()
--   local trimmed = line:match("^(.-)%s*$")
--
--   if trimmed == "" or trimmed:sub(-1) == ";" then
--     return ";"
--   end
--
--   return "<C-o>A;<CR>"
-- end, {
--   expr = true,
--   desc = "Smart semicolon (jump to end, add, and new line)",
-- })
--

local semicolon_langs = {
  "c",
  "cpp",
  "java",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "rust",
  "go",
  "csharp",
  "php",
  "swift",
  "kotlin",
  "scala",
  "dart",
  "css",
  "scss",
  "less",
}

local function uses_semicolons()
  return vim.tbl_contains(semicolon_langs, vim.bo.filetype)
end

-- vim.keymap.set("i", ";", function()
--   if not uses_semicolons() then
--     return ";"
--   end
--
--   local line = vim.api.nvim_get_current_line()
--   local trimmed = line:match("^(.-)%s*$")
--
--   if trimmed == "" or trimmed:sub(-1) == ";" then
--     return ";"
--   end
--
--   return "<C-o>A;<CR>"
-- end, {
--   expr = true,
--   desc = "Smart semicolon (semicolon languages only)"
-- })

vim.keymap.set("i", "<CR>", function()
  if not uses_semicolons() then
    return "<CR>"
  end

  local line = vim.api.nvim_get_current_line()
  local trimmed = line:match("^(.-)%s*$")

  if trimmed ~= "" and trimmed:sub(-1) ~= ";" and trimmed:sub(-1) ~= "{" and trimmed:sub(-1) ~= "}" then
    return "<C-o>A;<CR>"
  end

  return "<CR>"
end, {
  expr = true,
  desc = "Smart Enter (semicolon languages only)",
})
