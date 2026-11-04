return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use the mini.nvim suite
	ft = { "markdown", "rmd" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		file_types = { "markdown", "rmd" },

		pipe_table = {
			preset = "round",
		},

		latex = { enabled = false },
	},
}
