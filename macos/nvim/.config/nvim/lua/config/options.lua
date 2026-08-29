-- Basic Settings
vim.opt.nu = true  -- Line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.sidescrolloff = 8  -- Keep 8 columns to the left/right of the cursor
vim.opt.cmdheight = 1  -- Command line height
vim.opt.wrap = false  -- Disable line wrapping
vim.opt.cursorline = true  -- Highlight the current line
vim.opt.scrolloff = 5  -- Keep 5 lines above/below the cursor
vim.opt.whichwrap:append("<,>,[,],h,l")  -- Allow cursor to move to the next/previous line with these keys

-- Tabbing and Indentation
vim.opt.tabstop = 2  -- Number of spaces that a <Tab>
vim.opt.shiftwidth = 2  -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 2  -- Number of spaces that a <Tab> counts
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.smartindent = true  -- Smart auto-indenting
vim.opt.grepprg = "rg --vimgrep"  -- Use ripgrep for searching
vim.opt.grepformat = "%f:%l:%c:%m"  -- Format: file:line:column:message

-- Search Settings
vim.opt.ignorecase = true  -- Ignore case in search patterns
vim.opt.smartcase = true  -- Override 'ignorecase' if search pattern contains uppercase letters
vim.opt.hlsearch = false  -- Disable persistent search highlight

-- Visual Settings
vim.opt.termguicolors = true  -- Enable true color support
vim.opt.signcolumn = "yes"  -- Always show the sign column
vim.opt.colorcolumn = "100"  -- Highlight column 100
vim.opt.showmatch = true  -- Highlight matching parentheses
vim.opt.matchtime = 2  -- Tenths of a second to show the matching paren
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }
vim.opt.showmode = false  -- Don't show mode
vim.opt.pumheight = 10  -- Popup menu height
vim.opt.winblend = 0  -- Transparency for floating windows
vim.opt.conceallevel = 0  -- Don't conceal text
vim.opt.concealcursor = ""  -- Don't conceal text in the cursor line
vim.opt.redrawtime = 2000  -- Time in milliseconds to wait for a redraw
vim.opt.synmaxcol = 300  -- Syntax highlighting column limit
vim.opt.winborder = "rounded"  -- Use rounded borders for floating windows
vim.opt.list = true  -- Show whitespace characters

-- File Handling
vim.opt.backup = false  -- Don't create backup files
vim.opt.writebackup = false  -- Don't create backup files while writing
vim.opt.swapfile = false  -- Don't create swap files
vim.opt.undofile = true  -- Enable persistent undo
vim.opt.updatetime = 300  -- CursorHold trigger (gitsigns blame, LSP hover)
vim.opt.timeoutlen = 500  -- Time in ms to wait for a mapped sequence to complete
vim.opt.ttimeoutlen = 0  -- Time in ms to wait for a key code sequence to complete
vim.opt.autoread = true  -- Automatically read files when changed outside of Vim
vim.opt.autowrite = false  -- Don't automatically save files
vim.opt.diffopt = "vertical,algorithm:patience,linematch:60"  -- Diff options

-- Behavior Settings
vim.opt.autochdir = false  -- Don't change the working directory automatically
vim.opt.iskeyword:append("-")  -- Treat hyphens as part of words
vim.opt.path:append("**")  -- Search for files in subdirectories
vim.opt.clipboard:append("unnamedplus")  -- Use the system clipboard
vim.opt.wildmode = "longest:full,full"  -- Command-line completion mode
vim.opt.wildignorecase = true  -- Ignore case in file completion
vim.opt.textwidth = 100  -- Set maximum text width for automatic line breaks
vim.opt.formatoptions:remove("t")  -- ...but don't hard-wrap while typing; autocmd.lua re-enables it for prose
vim.opt.laststatus = 3 -- Use a single status line for all windows
vim.opt.shortmess = vim.opt.shortmess + "c"  -- Don't show completion messages

-- Folding Settings
vim.opt.foldlevel = 99  -- Start with all folds open

-- Split Behavior
vim.opt.splitright = true  -- Open vertical splits to the right
vim.opt.splitbelow = true  -- Open horizontal splits below


vim.opt.listchars = {
  space = "·",
  tab = "→ ",
  multispace = "·",
  leadmultispace = "·",
}

-- Set undo directory and ensure it exists
local undo_dir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undodir = vim.fn.expand(undo_dir)
local undodir_local = vim.fn.expand(undo_dir)
if vim.fn.isdirectory(undodir_local) == 0 then
  vim.fn.mkdir(undodir_local, "p")
end

-- Diagnostics (matches winborder = "rounded")
vim.diagnostic.config({
  -- Sem texto inline solto pelo arquivo: a mensagem completa aparece só na
  -- linha do cursor; as demais ficam apenas com o sinal no gutter.
  virtual_text = false,
  virtual_lines = { current_line = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
    },
  },
  underline = true,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
})

