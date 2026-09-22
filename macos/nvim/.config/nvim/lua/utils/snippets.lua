-- Helpers shared by the snippet files in lua/snippets/.
-- Kept outside lua/snippets/ because LuaSnip's from_lua loader treats every
-- file there as a snippet file.
local ls = require("luasnip")
local sn = ls.snippet_node
local i  = ls.insert_node

local M = {}

-- Math context as detected by VimTeX's syntax
M.in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

M.not_in_mathzone = function()
  return not M.in_mathzone()
end

-- For dynamic nodes: text cut with <Tab> in visual mode (store_selection_keys)
-- becomes the initial content of the node; with no selection, it starts empty.
M.get_visual = function(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

return M
