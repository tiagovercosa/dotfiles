return {
  "gbprod/nord.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    borders = true,
    terminal_colors = true,
    diff = { mode = "bg" },
    errors = { mode = "bg" },
    search = { theme = "vim" },
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { bold = true },
    },

    -- Groups the theme doesn't cover
    on_highlights = function(hl, c)
      hl.Whitespace = { fg = c.polar_night.brightest }
      hl.GitSignsAdd = { fg = "#6E806A" }
      hl.GitSignsChange = { fg = "#968769" }
      hl.GitSignsDelete = { fg = "#7E4D57" }
      hl.DiagnosticUnderlineHint = { undercurl = true, sp = c.aurora.red }
    end,
  },
  config = function(_, opts)
    require("nord").setup(opts)
    vim.cmd.colorscheme("nord")
  end,
}
