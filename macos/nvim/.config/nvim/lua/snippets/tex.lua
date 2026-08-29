local ls   = require("luasnip")
local s    = ls.snippet
local sn   = ls.snippet_node
local i    = ls.insert_node
local t    = ls.text_node
local c    = ls.choice_node
local f    = ls.function_node
local rep  = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local not_in_mathzone = function()
  return not in_mathzone()
end

return {  },
{
  s({ trig = "^eqq", regTrig = true, dscr = "Equation environment", condition = not_in_mathzone },
    fmta(
      [[
        \begin{equation}
            <>
        \end{equation}
      ]],
      { i(1) }
    )
  ),

  s({ trig = "^figg", regTrig = true, dscr = "Figure environment", condition = not_in_mathzone },
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

  s({ trig = "^sec", regTrig = true, dscr = "Section", condition = not_in_mathzone },
    fmta([[\section{<>}]], { i(1) })
  ),
  s({ trig = "ssec", dscr = "Subsection", condition = not_in_mathzone },
    fmta([[\subsection{<>}]], { i(1) })
  ),
  s({ trig = "sssec", dscr = "Subsubsection", condition = not_in_mathzone },
    fmta([[\subsubsection{<>}]], { i(1) })
  ),

  s({ trig = "ref", dscr = "Reference", condition = not_in_mathzone },
    fmta([[\ref{<>}]], { i(1) })
  ),
  s({ trig = "cite", dscr = "Citation", condition = not_in_mathzone },
    fmta([[\cite{<>}]], { i(1) })
  ),
    s({ trig = "^beg", regTrig = true, dscr = "Generic environment", condition = not_in_mathzone },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),

  s({ trig = "mk", dscr = "Inline math" },
    fmta([[$<>$]], { i(1) })
  ),

  s({ trig = "dm", dscr = "Display math" },
    fmta(
      [[
        \[
            <>
        \]
      ]],
      { i(1) }
    )
  ),

  s({ trig = "([%w%)%]%}])/", regTrig = true, wordTrig = false,
      dscr = "Inline fraction (a/ -> \\frac{a}{...})",
      condition = in_mathzone },
    fmta([[\frac{<>}{<>}]], {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
    })
  ),

  s({ trig = "//", dscr = "Empty fraction", condition = in_mathzone },
    fmta([[\frac{<>}{<>}]], { i(1), i(2) })
  ),

  s({ trig = "([%a])(%d)", regTrig = true, wordTrig = false,
      dscr = "Auto subscript: x1 -> x_1",
      condition = in_mathzone },
    f(function(_, snip)
      return snip.captures[1] .. "_" .. snip.captures[2]
    end)
  ),

  s({ trig = "sr", dscr = "Squared", condition = in_mathzone },
    t("^2")
  ),

  s({ trig = "cb", dscr = "Cubed", condition = in_mathzone },
    t("^3")
  ),

  s({ trig = "sq", dscr = "Square root", condition = in_mathzone },
    fmta([[\sqrt{<>}]], { i(1) })
  ),

  s({ trig = "sum", dscr = "Sum", condition = in_mathzone },
    fmta([[\sum_{<>}^{<>}]], { i(1, "n=1"), i(2, "\\infty") })
  ),

  s({ trig = "int", dscr = "Integral", condition = in_mathzone },
    fmta([[\int_{<>}^{<>} <>]], { i(1), i(2), i(3) })
  ),

  s({ trig = "lim", dscr = "Limit", condition = in_mathzone },
    fmta([[\lim_{<> \to <>}]], { i(1, "n"), i(2, "\\infty") })
  ),
}
