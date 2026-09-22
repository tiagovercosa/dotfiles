-- Text formatting. These also wrap a visual selection: select text, press
-- <Tab>, type the trigger, press <Tab>.
local ls   = require("luasnip")
local s    = ls.snippet
local d    = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

local u = require("utils.snippets")

-- Snippets (expand with <Tab>), autosnippets (expand as soon as typed)
return {},
{
  s({ trig = "tbf", dscr = "Bold text", condition = u.not_in_mathzone },
    fmta([[\textbf{<>}]], { d(1, u.get_visual) })
  ),

  s({ trig = "itt", dscr = "Italic text", condition = u.not_in_mathzone },
    fmta([[\textit{<>}]], { d(1, u.get_visual) })
  ),

  s({ trig = "ttt", dscr = "Monospaced text", condition = u.not_in_mathzone },
    fmta([[\texttt{<>}]], { d(1, u.get_visual) })
  ),
}
