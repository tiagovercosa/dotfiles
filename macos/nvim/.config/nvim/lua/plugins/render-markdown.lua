return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use the mini.nvim suite
	ft = { "markdown", "rmd" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		file_types = { "markdown", "rmd" },

		heading = {
			sign = false,
			border = false,
			position = "inline",
			width = "block",
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			backgrounds = {},
		},

		code = {
			sign = false,
			style = "full",
			width = "block",
			left_pad = 1,
			right_pad = 1,
			border = "thin",
		},

		bullet = {
			icons = { "•", "◦", "▪", "▫" },
		},

		checkbox = {
			unchecked = { icon = " 󰄱 " },
			checked = { icon = " 󰱒 " },
			custom = {
				todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownInfo" },
			},
		},

		pipe_table = {
			preset = "round",
		},

		latex = { enabled = false },
	},
}
