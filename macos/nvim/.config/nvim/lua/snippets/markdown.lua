local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local t    = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({ trig = "link", dscr = "Markdown link" },
    fmta([[[<>](<>)]], { i(1, "text"), i(2, "url") })
  ),
  s({ trig = "img", dscr = "Markdown image" },
    fmta([[![<>](<>)]], { i(1, "alt"), i(2, "path") })
  ),
},
{
  s({ trig = "^fmt", regTrig = true, dscr = "YAML frontmatter",
    condition = function()
      return vim.fn.line(".") == 1
    end },
    fmta(
      [[
        ---
        title: <>
        date: <>
        tags: <>
        ---

        <>
      ]],
      { i(1), t(os.date("%Y-%m-%d")), i(2), i(0) }
    )
  ),

  s({ trig = "^daily", regTrig = true, dscr = "YAML frontmatter",
    condition = function()
      return vim.fn.line(".") == 1
    end },
    fmta(
      [[
        ---
        date: <>
        tags:
          - daily
        ---

        # <>

        ## <>

        <>
      ]],
      { t(os.date("%Y-%m-%d")), t(os.date("%A, %d %b %Y")), t(os.date("%H:%M")), i(0) }
    )
  ),

  s({ trig = "^code", regTrig = true, dscr = "Fenced code block" },
    fmta(
      [[
        ```<>
        <>
        ```
      ]],
      { i(1, "lang"), i(2) }
    )
  ),
}

