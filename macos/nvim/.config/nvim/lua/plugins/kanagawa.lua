return {
  'rebelot/kanagawa.nvim',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('kanagawa').setup({
      theme = "wave",        -- the default theme, used when `background` is not set
      background = {
        dark = "wave",       -- "wave" (default) or "dragon" (darker, muted)
        light = "lotus",
      },
      compile = false,       -- compile the colorscheme to a cache for faster startup
      undercurl = true,      -- enables/disables undercurls on diagnostics
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      functionStyle = {},
      statementStyle = { bold = true },
      transparent = true,   -- do not set a background color
      dimInactive = false,   -- dim the background of inactive windows
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
    })

    -- Load the colorscheme
    vim.cmd.colorscheme("kanagawa")
  end,
}
