local map = vim.keymap.set
local opts = { silent = true }

map("n", "<leader>w", ":write<cr>", opts)
map("n", "<leader>q", ":quit<cr>", opts)
map("n", "<leader>Q", ":quit!<cr>", opts)
map("n", "<leader>x", ":xit<cr>", opts)
map("n", "<leader>v", ":e $MYVIMRC<cr>", opts)
map("n", "<leader>z", ":e $HOME/.config/zsh/.zshrc<cr>", opts)
map("n", "<leader>b", ":e #<cr>", opts)
map({ "n", "v" }, "<leader>n", ":norm ", { silent = false })
map({ "n", "v" }, "<leader>r", ":restart<cr>", opts)

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("n", "<leader>t", vim.diagnostic.open_float, opts)
map("n", "<leader>gf", vim.lsp.buf.format, opts)
map("n", "<leader>gd", vim.lsp.buf.definition, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)

map("n", "<leader>e", ":Oil<CR>", opts)

