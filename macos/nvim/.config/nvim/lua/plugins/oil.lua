return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("oil").setup({
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        -- Configurações de visualização do buffer
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, bufnr)
            return name == ".." or name == ".git"
          end,
        },
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

      vim.keymap.set("n", "<leader>e", function()
        require("oil").toggle_float()
      end, { desc = "Toggle floating file explorer" })

    end
  }
}

