return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern", -- teste "classic", "modern" ou "helix"
		win = {
			border = "rounded",
			padding = { 1, 2 },
		},
		spec = {
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Código" },
			{ "<leader>f", group = "Buscar" },
			{ "<leader>g", group = "LSP" },
			{ "<leader>h", group = "Git" },
			{ "<leader>r", group = "Renomear" },
			{ "<leader>s", group = "Split" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Atalhos do buffer",
		},
	},
}
