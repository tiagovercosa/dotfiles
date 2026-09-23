return {
  "gbprod/nord.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("nord").setup({
      -- Only Normal/SignColumn lose their background (use the terminal's);
      -- floating windows stay opaque for readability.
      transparent = true,
      terminal_colors = true,
      diff = { mode = "bg" },
      borders = true,
      errors = { mode = "bg" },
      search = { theme = "vim" },
      styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
        errors = {},
        lualine_bold = true,
      },
      -- Groups the theme doesn't cover. Defined here (not with nvim_set_hl in
      -- each plugin's config) so they survive a :colorscheme reload.
      on_highlights = function(hl, c)
        -- indent-blankline
        hl.Whitespace = { fg = c.polar_night.brightest }
        hl.IblIndent = { fg = c.polar_night.brightest }
        hl.IblWhitespace = { link = "Whitespace" }
        hl.IblScope = { fg = c.frost.ice }
      end,
    })

    vim.cmd.colorscheme("nord")
  end,
}
