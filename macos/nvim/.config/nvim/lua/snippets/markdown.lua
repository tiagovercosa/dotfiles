local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local t    = ls.text_node
local f    = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

-- Datas e horas usam function_node, não text_node: dentro de t() o os.date()
-- roda uma única vez, quando este arquivo é carregado, e o valor fica
-- congelado pelo resto da sessão.
local function agora(formato)
  return f(function() return os.date(formato) end)
end

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
      { i(1), agora("%Y-%m-%d"), i(2), i(0) }
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

        ## Notes Today
        !\[\[Daily.base\]\]
      ]],
      { agora("%Y-%m-%d"), agora("%A, %d %b %Y"), agora("%H:%M"), i(0) }
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

