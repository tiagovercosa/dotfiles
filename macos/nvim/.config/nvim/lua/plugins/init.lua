-- vim.pack has no build step: compile native parts whenever a plugin is
-- installed or updated (LuaSnip's jsregexp, telescope's fzf sorter).
local builds = {
	["LuaSnip"] = { "make", "install_jsregexp" },
	["telescope-fzf-native.nvim"] = { "make" },
}
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local data = ev.data
		local cmd = builds[data.spec.name]
		if cmd and data.kind ~= "delete" then
			vim.system(cmd, { cwd = data.path })
		end
	end,
})

-- remove plugins from disk that are no longer in vim.pack.add() specs
vim.api.nvim_create_user_command("PackClean", function()
	local inactive = vim.iter(vim.pack.get())
		:filter(function(x)
			return not x.active
		end)
		:map(function(x)
			return x.spec.name
		end)
		:totable()
	if #inactive == 0 then
		vim.notify("No inactive plugins to remove", vim.log.levels.INFO)
		return
	end
	vim.pack.del(inactive)
	vim.notify("Removed: " .. table.concat(inactive, ", "), vim.log.levels.INFO)
end, { desc = "Remove plugins not in vim.pack.add() specs" })

require("plugins.vimtex")

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
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",

	-- LSP, completion, snippets and formatting
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/stevearc/conform.nvim",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2") },
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/zbirenbaum/copilot.lua",

	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/folke/which-key.nvim",
})

require("plugins.colorscheme")
require("plugins.mini")
require("plugins.oil")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.render-markdown")
require("plugins.ltex_extra")
require("plugins.gitsigns")
require("plugins.mason")
require("plugins.conform")
require("plugins.luasnip")
require("plugins.blink")
require("plugins.which-key")
require("plugins.copilot")
