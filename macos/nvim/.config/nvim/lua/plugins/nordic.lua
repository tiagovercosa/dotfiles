return {
  'AlexvZyl/nordic.nvim',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('nordic').setup({
      bold_keywords = false,
      italic_comments = true,
      transparent = {
        bg = true,     -- do not set a background color (use the terminal's)
        float = false, -- keep floating windows opaque for readability
      },
      bright_border = false,
      reduced_blue = true,
      cursorline = {
        bold = false,
        bold_number = true,
        theme = 'dark',
        blend = 0.85,
      },
      telescope = {
        style = 'flat',
      },
    })

    -- Load the colorscheme
    vim.cmd.colorscheme("nordic")
  end,
}
