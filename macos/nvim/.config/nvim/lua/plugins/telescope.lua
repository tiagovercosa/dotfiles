return {
  {
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-ui-select.nvim" },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local themes = require("telescope.themes")
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "%.aux", "%.log", "%.out" },
        },
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          ["ui-select"] = {
            themes.get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>fd', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fc', function ()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath('config')
        }
      end)
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
  },
}

