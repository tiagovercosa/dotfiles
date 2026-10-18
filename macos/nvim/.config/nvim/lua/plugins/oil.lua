require("oil").setup({
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  win_options = {
    signcolumn = "yes:2",
  },
  -- Configurações de visualização do buffer
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, bufnr)
      return name == ".." or name == ".git"
    end,
  },
})

require("oil-git-status").setup({
  show_ignored = false
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

