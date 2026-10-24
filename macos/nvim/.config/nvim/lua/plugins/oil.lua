return {
	"stevearc/oil.nvim",
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
		"refractalize/oil-git-status.nvim",
	},
	keys = {
		{ "<leader>e", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
	lazy = false,
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
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
	},

	config = function(_, opts)
		require("oil").setup(opts)
		require("oil-git-status").setup({
			show_ignored = false,
		})
	end,
}
