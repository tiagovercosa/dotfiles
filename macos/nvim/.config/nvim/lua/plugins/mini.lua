return {
	{ "nvim-mini/mini.ai", event = "VeryLazy", opts = {} },
	{ "nvim-mini/mini.align", event = "VeryLazy", opts = {} },
	{
		"nvim-mini/mini.surround",
		event = "VeryLazy",
		opts = {
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
		},
	},
	{
		"nvim-mini/mini.icons",
		event = "VeryLazy",
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
}
