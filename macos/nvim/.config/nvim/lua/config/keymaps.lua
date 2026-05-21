local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Center screen
map("n", "n", "nzz", { desc = "Next search result" })
map("n", "N", "Nzz", { desc = "Previous search result" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Buffer navigation
map("n", "<leader>bn", ":bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<cr>", { desc = "Previus buffer" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

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

map("n", "<leader>w", ":write<cr>", opts)
map("n", "<leader>q", ":quit<cr>", opts)
map("n", "<leader>Q", ":quit!<cr>", opts)
map("n", "<leader>x", ":xit<cr>", opts)
map("n", "<leader>v", ":e $MYVIMRC<cr>", opts)
map("n", "<leader>z", ":e $HOME/.config/zsh/.zshrc<cr>", opts)
map("n", "<leader>b", ":e #<cr>", opts)

map("n", "<leader>t", vim.diagnostic.open_float, opts)
map("n", "<leader>gf", vim.lsp.buf.format, opts)
map("n", "<leader>gd", vim.lsp.buf.definition, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)

