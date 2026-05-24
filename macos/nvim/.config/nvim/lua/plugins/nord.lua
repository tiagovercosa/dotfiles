return {
  'shaunsingh/nord.nvim',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.g.nord_contrast = true                   -- Make sidebars and popup menus like nvim-tree and telescope have a different background
    vim.g.nord_borders = true                   -- Enable the border between verticaly split windows visable
    vim.g.nord_disable_background = true         -- Disable the setting of background color so that NeoVim can use your terminal background
    vim.g.nord_cursorline_transparent = false     -- Set the cursorline transparent/visible
    vim.g.nord_italic = true                    -- enables/disables italics
    vim.g.nord_enable_sidebar_background = true -- Re-enables the background of the sidebar if you disabled the background of everything
    vim.g.nord_uniform_diff_background = true    -- enables/disables colorful backgrounds when used in diff mode
    vim.g.nord_bold = true                      -- enables/disables bold

    -- Load the colorscheme
    require('nord').set()

    -- Toggle background transparency
    local toggle_transparency = function()
      vim.g.nord_disable_background = not vim.g.nord_disable_background
      vim.cmd.colorscheme("nord")
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency,
      { desc = "Toggle Nord background transparency" })
  end,
}
