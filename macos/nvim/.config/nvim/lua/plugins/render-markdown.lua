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
      heading = {
        enabled = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        border = true,
      },

      code = {
        enabled = true,
        sign = true,
        style = "full",
        width = "block",
        right_pad = 1,
      },

      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
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
        preset = "heavy", -- Deixa as bordas da tabela mais marcadas
      },
    },
  }
}
