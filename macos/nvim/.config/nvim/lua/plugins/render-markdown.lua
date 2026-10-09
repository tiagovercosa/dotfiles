return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },

    ---@module 'render-markdown'
    ft = { "markdown", "rmd" },

    opts = {
      -- Títulos minimalistas: só a cor do texto, sem faixa de fundo, borda ou
      -- ícone na coluna de sinais. O ícone substitui os "#" na própria linha.
      heading = {
        enabled = true,
        sign = false,
        border = false,
        position = "inline",
        width = "block",
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        backgrounds = {},
      },

      code = {
        enabled = true,
        sign = false,
        style = "full",
        width = "block",
        left_pad = 1,
        right_pad = 1,
        border = "thin",
      },

      bullet = {
        enabled = true,
        icons = { "•", "◦", "▪", "▫" },
      },

      checkbox = {
        enabled = true,
        unchecked = { icon = " 󰄱 " },
        checked = { icon = " 󰱒 " },
        -- Estilo opcional para tarefas em andamento (ex: [-])
        custom = {
          todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownInfo" },
        },
      },

      pipe_table = {
        enabled = true,
        preset = "round",
      },

      -- Exige o parser latex do treesitter e o utftex/latex2text, nenhum dos
      -- dois instalado: só gerava aviso no checkhealth, sem renderizar nada.
      latex = { enabled = false },
    },
  }
}
