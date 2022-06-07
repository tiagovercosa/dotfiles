-- Cria uma variável local "options" que será lida por uma loop "for"
local options = {
  clipboard = "unnamedplus",            -- Allows neovim to access the system clipboard
  number = true,                        -- Set numbered lines
  backup = false,                       -- Creates a backup file
  relativenumber = true,                -- Set relative numbered lines
  cursorline = true,                    -- Enable highlighting of the current line
  smarttab = true,                      -- Makes tabbing smarter will realize you have 2 vs 4
  updatetime = 300,                     -- Faster completion (4000ms default)
  mouse = "a",			                  	-- Allow the mouse to be used in neovim
  syntax = "enable",    		            -- Enables syntax highlighing
  tabstop = 2,	        		            -- Insert 2 spaces for a tab
  expandtab = true,                     -- Converts tabs to spaces
  scrolloff = 8,                        -- Is one of my fav
  fileencoding = "utf-8",               -- The encoding written to a file
  encoding = "utf-8",                   -- The encoding displayed
  splitbelow = true,                    -- Horizontal splits to go below current window
  splitright = true,                    -- Vertical splits to go to the right of current window
  colorcolumn = "80",                  -- Draws a line at the given line to keep aware of the line size
  conceallevel = 0,                     -- So that `` is visible in markdown files
  shiftwidth = 2,                       -- The number of spaces inserted for each indentation
  numberwidth = 4,                      -- Set number column width to 2 {default 4}
  cmdheight = 2,                        -- more space in the neovim command line for displaying messages
  hlsearch = true,                      -- highlight all matches on previous search pattern
  ignorecase = true,                    -- ignore case in search patterns
  smartcase = true,                     -- smart case
  showmode = false,                     -- we don't need to see things like -- INSERT -- anymore
  signcolumn = "yes",                   -- always show the sign column, otherwise it would shift the text each time
  showtabline = 2,                      -- always show tabs
  background = "dark",                  -- tell vim what the background color looks like
  pumheight = 10,                       -- pop up menu height
  smartindent = true,                   -- make indenting smarter again
  termguicolors = true,                 -- set term gui colors (most terminals support this)
  -- timeoutlen = 100,                     -- time to wait for a mapped sequence to complete (in milliseconds)
  writebackup = false,                  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  swapfile = false,                     -- creates a swapfile
  undofile = true,                      -- enable persistent undo
  wrap = true,                         -- display lines as one long line
  autoread = true,                      -- trigger `autoread` when files changes on disk
  hidden = true,                        -- Required to keep multiple buffers open multiple buffers
  incsearch = true,                     -- Incremental search
  linebreak = true,                     -- Prevents words from breaking over line
  breakindent = true,                   -- Indent wrapped lines
  ruler = true,            			        -- Show the cursor position all the time
  laststatus = 2,                       -- Always display the status line
  autochdir = true,                     -- Your working directory will always be the same as your working directory
  autoindent = true,                    -- Good auto indent
  softtabstop = 4,
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  sidescrolloff = 8,                    -- ???
  compatible = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "filetype on"
vim.cmd "filetype plugin on"
vim.cmd "set t_Co=256"                  -- Support 256 colors
vim.cmd "set iskeyword+=-"              -- Treat dash separated words as a word text object
vim.cmd "set formatoptions-=cro"        -- Stop newline continuation of comments
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set path+=**"
vim.cmd "let &showbreak='  '"           -- Indent amount

vim.cmd "set formatoptions-=cro"        -- TODO: this doesn't seem to work


--print(vim.api.nvim_get_option('smarttab'))
