-- LaTeX environments (begin/end blocks)
local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local rep  = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local u = require("utils.snippets")

-- Snippets (expand with <Tab>), autosnippets (expand as soon as typed)
return {},
{
  s({ trig = "^eqq", regTrig = true, dscr = "Equation environment", condition = u.not_in_mathzone },
    fmta(
      [[
        \begin{equation}
            <>
        \end{equation}
      ]],
      { i(1) }
    )
  ),

  s({ trig = "^figg", regTrig = true, dscr = "Figure environment", condition = u.not_in_mathzone },
    fmta(
      [[
        \begin{figure}[<>]
            \centering
            \includegraphics[width=<>\textwidth]{<>}
            \caption{<>}
            \label{fig:<>}
        \end{figure}
      ]],
      { i(1, "htbp"), i(2, "0.8"), i(3, "path"), i(4), i(5) }
    )
  ),

  s({ trig = "^beg", regTrig = true, dscr = "Generic environment", condition = u.not_in_mathzone },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),
}
