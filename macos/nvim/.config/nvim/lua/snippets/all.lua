local ls = require("luasnip")
local s  = ls.snippet
local i  = ls.insert_node
local t  = ls.text_node
local f  = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  -- function_node, não text_node: dentro de t() o os.date() rodaria uma única
  -- vez, no carregamento do arquivo, e a data ficaria congelada pela sessão.
  s("date", {
    f(function() return os.date("%Y-%m-%d") end),
  }),
  s("todo", {
    t("TODO: "), i(1),
  }),
}
