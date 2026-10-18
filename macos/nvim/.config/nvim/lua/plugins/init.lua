-- vim.pack has no build step: compile LuaSnip's jsregexp (used by
-- snippet transformations) whenever it is installed or updated.
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local data = ev.data
		if data.spec.name == "LuaSnip" and data.kind ~= "delete" then
			vim.system({ "make", "install_jsregexp" }, { cwd = data.path })
		end
	end,
})

vim.pack.add({
	"https://github.com/gbprod/nord.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/refractalize/oil-git-status.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/lervag/vimtex",
	"https://github.com/meanderingprogrammer/render-markdown.nvim",
	"https://github.com/barreiroleo/ltex_extra.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",

	-- LSP, completion, snippets and formatting
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/stevearc/conform.nvim",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2") },
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
	"https://github.com/nvim-lualine/lualine.nvim",

	-- Ctrl-h/j/k/l between splits and tmux panes (counterpart of the tmux plugin)
	"https://github.com/christoomey/vim-tmux-navigator",
})

require("plugins.colorscheme")
require("plugins.mini")
require("plugins.oil")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.vimtex")
require("plugins.render-markdown")
require("plugins.ltex_extra")
require("plugins.gitsigns")
require("plugins.mason")
require("plugins.conform")
require("plugins.luasnip")
require("plugins.blink")
