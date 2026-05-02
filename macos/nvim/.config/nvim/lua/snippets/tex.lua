local ls   = require("luasnip")
local s    = ls.snippet
local sn   = ls.snippet_node
local i    = ls.insert_node
local t    = ls.text_node
local c    = ls.choice_node
local f    = ls.function_node
local rep  = require("luasnip.extras").rep
local fmt  = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local not_in_mathzone = function()
  return not in_mathzone()
end

return {
  s({ trig = "beg", dscr = "Generic environment" },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),

  s({ trig = "eq", dscr = "Equation environment" },
    fmta(
      [[
        \begin{equation}
            <>
        \end{equation}
      ]],
      { i(1) }
    )
  ),

  s({ trig = "fig", dscr = "Figure environment" },
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

  s({ trig = "sec", dscr = "Section" },
    fmta([[\section{<>}]], { i(1) })
  ),
  s({ trig = "ssec", dscr = "Subsection" },
    fmta([[\subsection{<>}]], { i(1) })
  ),
  s({ trig = "sssec", dscr = "Subsubsection" },
    fmta([[\subsubsection{<>}]], { i(1) })
  ),

  s({ trig = "ref", dscr = "Reference" },
    fmta([[\ref{<>}]], { i(1) })
  ),
  s({ trig = "cite", dscr = "Citation" },
    fmta([[\cite{<>}]], { i(1) })
  ),
}, {
  s({ trig = "mk", dscr = "Inline math", snippetType = "autosnippet" },
    fmta([[$<>$]], { i(1) })
  ),

  s({ trig = "dm", dscr = "Display math", snippetType = "autosnippet" },
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
      snippetType = "autosnippet", dscr = "Inline fraction (a/ -> \\frac{a}{...})",
      condition = in_mathzone },
    fmta([[\frac{<>}{<>}]], {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
    })
  ),

  s({ trig = "//", dscr = "Empty fraction", snippetType = "autosnippet",
      condition = in_mathzone },
    fmta([[\frac{<>}{<>}]], { i(1), i(2) })
  ),

  s({ trig = "([%a])(%d)", regTrig = true, wordTrig = false,
      snippetType = "autosnippet", dscr = "Auto subscript: x1 -> x_1",
      condition = in_mathzone },
    f(function(_, snip)
      return snip.captures[1] .. "_" .. snip.captures[2]
    end)
  ),

  s({ trig = "sr", dscr = "Squared", snippetType = "autosnippet",
      condition = in_mathzone },
    t("^2")
  ),
  s({ trig = "cb", dscr = "Cubed", snippetType = "autosnippet",
      condition = in_mathzone },
    t("^3")
  ),

  s({ trig = "sq", dscr = "Square root", snippetType = "autosnippet",
      condition = in_mathzone },
    fmta([[\sqrt{<>}]], { i(1) })
  ),

  s({ trig = "sum", dscr = "Sum", snippetType = "autosnippet",
      condition = in_mathzone },
    fmta([[\sum_{<>}^{<>}]], { i(1, "n=1"), i(2, "\\infty") })
  ),
  s({ trig = "int", dscr = "Integral", snippetType = "autosnippet",
      condition = in_mathzone },
    fmta([[\int_{<>}^{<>} <>]], { i(1), i(2), i(3) })
  ),
  s({ trig = "lim", dscr = "Limit", snippetType = "autosnippet",
      condition = in_mathzone },
    fmta([[\lim_{<> \to <>}]], { i(1, "n"), i(2, "\\infty") })
  ),
}
