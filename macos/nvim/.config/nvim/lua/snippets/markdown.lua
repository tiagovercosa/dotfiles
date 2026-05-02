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
  s({ trig = "code", dscr = "Fenced code block" },
    fmta(
      [[
        ```<>
        <>
        ```
      ]],
      { i(1, "lang"), i(2) }
    )
  ),
  s({ trig = "fm", dscr = "YAML frontmatter" },
    fmta(
      [[
        ---
        title: <>
        date: <>
        ---

        <>
      ]],
      { i(1), t(os.date("%Y-%m-%d")), i(0) }
    )
  ),
}, {
  s({ trig = "mk", dscr = "Inline math", snippetType = "autosnippet" },
    fmta([[$<>$]], { i(1) })
  ),
  s({ trig = "dm", dscr = "Display math", snippetType = "autosnippet" },
    fmta(
      [[
        $$
        <>
        $$
      ]],
      { i(1) }
    )
  ),
}
