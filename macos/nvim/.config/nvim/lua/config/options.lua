require("vim._core.ui2").enable({})
vim.g.mapleader = "," -- space leader key
vim.g.maplocalleader = " " -- space leader key

-- Basic Settings
vim.o.nu = true -- enable line numbers
vim.o.rnu = true -- enable relative line numbers
vim.o.ch = 2 -- hide bottom cmdline
vim.o.cul = true -- enable cursor line
vim.o.so = 8 -- always keep 8 lines above/below cursor unless at start/end of file
vim.o.ai = true -- copy indent from current line when starting new line
vim.o.wrap = false -- disable wrapping
vim.o.bri = true -- prevent line wrapping
vim.o.lbr = true -- wrap at word boundaries, not mid-word

-- Tabbing and Indentation
vim.o.ts = 2 -- how many spaces tab inserts
vim.o.sts = 2 -- how many spaces tab inserts
vim.o.sw = 2 -- controls number of spaces when using >> or << commands
vim.o.et = true -- use appropriate number of spaces with tab
vim.o.si = true -- indenting correctly after {

-- Visual Settings
vim.o.tgc = true -- enable 24-bit colors
vim.o.ph = 10 -- max height of completion menu
vim.o.winborder = "rounded" -- rounded border
vim.o.pumborder = vim.o.winborder
vim.o.scl = "auto:2" -- always show sign column
vim.o.cc = "70" -- highlight column 70
vim.o.list = true -- show whitespace characters
vim.o.sm = true -- highlight matching parentheses
vim.o.mat = 2 -- Tenths of a second to show the matching paren
vim.o.smc = 300 -- syntax highlighting column limit
vim.o.smd = false -- Don't show mode
vim.opt.listchars = {
	tab = "→ ",
	multispace = "·",
	leadmultispace = "| ",
	trail = "·",
}

-- File Handling
vim.o.ut = 200 -- save swap file with 200ms debouncing
vim.o.swf = false -- disable swapfile
vim.o.bk = false -- disable backup on q
vim.o.wb = false -- don't create backup while writing
vim.o.udf = true -- persistant undo history
vim.o.ar = true -- auto update file if changed outside of nvim
vim.o.dip = "vertical,algorithm:patience" -- Diff options

-- Search Settings
vim.o.ic = true -- case-insensitive search
vim.o.scs = true -- until search pattern contains upper case characters
vim.o.is = true -- enable highlighting search in progress
vim.o.hls = false -- Disable persistent search highlight
vim.o.grepprg = "rg --vimgrep" -- Use ripgrep for searching
vim.o.grepformat = "%f:%l:%c:%m" -- Format: file:line:column:message

-- Split Behavior
vim.o.sb = true -- better splitting
vim.o.spr = true -- better splitting

-- Folding Settings
vim.o.fdl = 99 -- start with all fold open
vim.o.fdls = 99 -- fold espanded always

-- Behavior Settings
vim.opt.cb = "unnamedplus" -- Use the system clipboard
vim.opt.wic = true -- Ignore case in file completion

vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})
