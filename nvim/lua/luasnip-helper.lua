local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function M.in_mathzone()
  return vim.fn.exists("*vimtex#syntax#in_mathzone") == 1 and vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

function M.not_in_mathzone()
  return not M.in_mathzone()
end

function M.get_visual(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

function M.in_text()
  return not M.in_mathzone()
end

function M.line_begin_or_non_letter(line_to_cursor, matched_trigger)
  local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
  local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match('[ :`=%{%(%["]')
  return line_begin or non_letter
end

function M.line_begin(line_to_cursor, matched_trigger)
  return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
end

M.in_comment = function() -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
M.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
M.in_equation = function() -- equation environment detection
  return M.in_env("equation")
end
M.in_itemize = function() -- itemize environment detection
  return M.in_env("itemize")
end
M.in_tikz = function() -- TikZ picture environment detection
  return M.in_env("tikzpicture")
end

return M

-- local M = {}
--
-- local ls = require("luasnip")
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep
--
-- function M.in_mathzone()
--   return vim.fn.exists("*vimtex#syntax#in_mathzone") == 1 and vim.fn["vimtex#syntax#in_mathzone"]() == 1
-- end
--
-- function M.not_in_mathzone()
--   return not M.in_mathzone()
-- end
--
-- function M.get_visual(args, parent)
--   if #parent.snippet.env.LS_SELECT_RAW > 0 then
--     return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
--   else
--     return sn(nil, i(1, ""))
--   end
-- end
--
-- function M.line_begin_or_non_letter(line_to_cursor, matched_trigger)
--   local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
--   local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match('[ :`=%{%(%["]')
--   return line_begin or non_letter
-- end
--
-- return M
