-- Cross-references and citations
local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local u = require("utils.snippets")

-- Snippets (expand with <Tab>), autosnippets (expand as soon as typed)
return {},
{
  s({ trig = "ref", dscr = "Reference", condition = u.not_in_mathzone },
    fmta([[\ref{<>}]], { i(1) })
  ),
  s({ trig = "cite", dscr = "Citation", condition = u.not_in_mathzone },
    fmta([[\cite{<>}]], { i(1) })
  ),
}
