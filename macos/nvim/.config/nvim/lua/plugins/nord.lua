return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
      transparent = {
        bg = true,
        float = true,
      },
      cursorline = {
        theme = "dark",
      },

      bold_keywords = true,
      italic_comments = true,

      integrations = {
        telescope = true,
        treesitter = true,
      },

      on_highlight = function(highlights, palette)
        highlights.Comment = { fg = palette.gray4, italic = true }
      end,
    })
      require('nordic').load()
    end
  }
}

