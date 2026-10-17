local map = vim.keymap.set

-- Center screen
map("n", "n", "nzz", { desc = "Next search result" })
map("n", "N", "Nzz", { desc = "Previous search result" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Buffer navigation
map("n", "<leader>bn", ":bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<cr>", { desc = "Previous buffer" })

-- Splitting and resizing
map("n", "<leader>sv", ":vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>sh", ":split<cr>", { desc = "Horizontal split" })
map("n", "<S-Up>", ":resize +2<cr>", { desc = "Resize up" })
map("n", "<S-Down>", ":resize -2<cr>", { desc = "Resize down" })
map("n", "<S-Left>", ":vertical resize -2<cr>", { desc = "Resize left" })
map("n", "<S-Right>", ":vertical resize +2<cr>", { desc = "Resize right" })

-- Indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Better behavior for J and K
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

map("n", "<leader>w", ":write<cr>", { silent = true, desc = "Save file" })
map("n", "<leader>q", ":quit<cr>", { silent = true, desc = "Quit window" })
map("n", "<leader>Q", ":quit!<cr>", { silent = true, desc = "Force quit window" })
map("n", "<leader>x", ":xit<cr>", { silent = true, desc = "Save and quit" })
map("n", "<leader>v", ":e $MYVIMRC<cr>", { silent = true, desc = "Edit init.lua" })
map("n", "<leader>z", ":e $HOME/.config/zsh/.zshrc<cr>", { silent = true, desc = "Edit .zshrc" })
map("n", "<leader>ba", ":e #<cr>", { silent = true, desc = "Alternate buffer" })

-- Undo tree (builtin plugin from 0.12, loaded only on first use)
map("n", "<leader>u", function()
  vim.cmd.packadd("nvim.undotree")
  require("undotree").open()
end, { desc = "Toggle undotree" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function bopts(desc)
      return { buffer = ev.buf, silent = true, desc = desc }
    end
    map("n", "<leader>t", vim.diagnostic.open_float, bopts("Show diagnostic float"))
    map("n", "<leader>gd", vim.lsp.buf.definition, bopts("Go to definition"))
    map("n", "<leader>rn", vim.lsp.buf.rename, bopts("Rename symbol"))
    map("n", "<leader>ca", vim.lsp.buf.code_action, bopts("Code action"))
    -- [d / ]d já são mapeamentos padrão do Neovim (vim.diagnostic.jump).
  end,
})
