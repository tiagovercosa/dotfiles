return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Próximo TODO",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "TODO anterior",
		},
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Telescope TODOs" },
	},
}
