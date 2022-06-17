local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Encurtar a API para um único nome
local keymap = vim.api.nvim_set_keymap

-- Remapeando vírgura como tecla líder
--keymap( "", "<Space>", "<Nop>", opts )
vim.g.mapleader = ","
vim.g.maplocalleader = ";"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal Mode
-- move among buffers with Shift
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-d>", ":bdelete<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Custom
-- Compile the current file
keymap("n", "<C-c>", ":!compiler % <cr>", opts)

-- Open the output file from the opened file
keymap("n", "<C-o>", ":!opout % <cr><cr>", opts)

keymap("n", "<F2>", ":e .<cr>", opts)
keymap("n", "<F3>", ":e ~/.config/nvim/<cr>", opts)

-- LaTeX bindings
keymap("n", "<LocalLeader>c", ":VimtexCountWords<CR>", opts)
keymap("n", "<LocalLeader>l", ":VimtexCompile<CR>", opts)
keymap("n", "<LocalLeader>k", ":VimtexStop<CR>", opts)
keymap("n", "<LocalLeader>t", ":VimtexTocOpen<CR>", opts)
keymap("n", "<LocalLeader>p", ":VimtexView<CR>", opts)
keymap("n", "<LocalLeader>x", ":VimtexClean<CR>", opts)
keymap("n", "<LocalLeader>b", ":VimtexLabelsToggle<CR>", opts)

-- Nvim-Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<Leader>n", ":NvimTreeFindFile<CR>", opts)
