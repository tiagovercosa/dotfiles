-- Math: entering math mode, fractions, sub/superscripts, operators
local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local t    = ls.text_node
local f    = ls.function_node
local d    = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

local u = require("utils.snippets")

-- Snippets (expand with <Tab>), autosnippets (expand as soon as typed)
return {
  -- Selection becomes the numerator: select, <Tab>, ff, <Tab>
  s({ trig = "ff", dscr = "Fraction (selection becomes the numerator)", condition = u.in_mathzone },
    fmta([[\frac{<>}{<>}]], { d(1, u.get_visual), i(2) })
  ),
},
{
  -- Math delimiters
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

  -- Fractions
  s({ trig = "([%w%)%]%}])/", regTrig = true, wordTrig = false,
      dscr = "Inline fraction (a/ -> \\frac{a}{...})",
      condition = u.in_mathzone },
    fmta([[\frac{<>}{<>}]], {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
    })
  ),

  s({ trig = "//", dscr = "Empty fraction", condition = u.in_mathzone },
    fmta([[\frac{<>}{<>}]], { i(1), i(2) })
  ),

  -- Sub/superscripts and roots
  s({ trig = "([%a])(%d)", regTrig = true, wordTrig = false,
      dscr = "Auto subscript: x1 -> x_1",
      condition = u.in_mathzone },
    f(function(_, snip)
      return snip.captures[1] .. "_" .. snip.captures[2]
    end)
  ),

  s({ trig = "sr", dscr = "Squared", condition = u.in_mathzone },
    t("^2")
  ),

  s({ trig = "cb", dscr = "Cubed", condition = u.in_mathzone },
    t("^3")
  ),

  s({ trig = "sq", dscr = "Square root", condition = u.in_mathzone },
    fmta([[\sqrt{<>}]], { i(1) })
  ),

  -- Big operators
  s({ trig = "sum", dscr = "Sum", condition = u.in_mathzone },
    fmta([[\sum_{<>}^{<>}]], { i(1, "n=1"), i(2, "\\infty") })
  ),

  s({ trig = "int", dscr = "Integral", condition = u.in_mathzone },
    fmta([[\int_{<>}^{<>} <>]], { i(1), i(2), i(3) })
  ),

  s({ trig = "lim", dscr = "Limit", condition = u.in_mathzone },
    fmta([[\lim_{<> \to <>}]], { i(1, "n"), i(2, "\\infty") })
  ),
}
