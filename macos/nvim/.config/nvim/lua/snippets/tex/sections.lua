-- Document structure: sections
local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local u = require("utils.snippets")

-- Snippets (expand with <Tab>), autosnippets (expand as soon as typed)
return {},
{
  s({ trig = "^sec", regTrig = true, dscr = "Section", condition = u.not_in_mathzone },
    fmta([[\section{<>}]], { i(1) })
  ),
  s({ trig = "^ssec", regTrig = true, dscr = "Subsection", condition = u.not_in_mathzone },
    fmta([[\subsection{<>}]], { i(1) })
  ),
  s({ trig = "^sssec", regTrig = true, dscr = "Subsubsection", condition = u.not_in_mathzone },
    fmta([[\subsubsection{<>}]], { i(1) })
  ),
}
