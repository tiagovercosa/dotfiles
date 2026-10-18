require("render-markdown").setup({
  file_types = { "markdown", "rmd" },

  heading = {
    sign = false,
    border = false,
    position = "inline",
    width = "block",
    icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    backgrounds = {},
  },

  code = {
    sign = false,
    style = "full",
    width = "block",
    left_pad = 1,
    right_pad = 1,
    border = "thin",
  },

  bullet = {
    icons = { "•", "◦", "▪", "▫" },
  },

  checkbox = {
    unchecked = { icon = " 󰄱 " },
    checked = { icon = " 󰱒 " },
    custom = {
      todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownInfo" },
    },
  },

  pipe_table = {
    preset = "round",
  },

  -- Exige o parser latex do treesitter e o utftex/latex2text, nenhum dos
  -- dois instalado: só gerava aviso no checkhealth, sem renderizar nada.
  latex = { enabled = false },
})
