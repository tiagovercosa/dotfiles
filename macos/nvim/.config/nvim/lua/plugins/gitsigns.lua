return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    current_line_blame = true,
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.nav_hunk('next') end)
        return '<Ignore>'
      end, {expr=true, buffer = bufnr, desc = "Próxima alteração Git"})

      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.nav_hunk('prev') end)
        return '<Ignore>'
      end, {expr=true, buffer = bufnr, desc = "Alteração Git anterior"})

      vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = "Preview do Git Hunk" })

    end
  }
}

