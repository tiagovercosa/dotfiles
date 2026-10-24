return {
	{ "nvim-mini/mini.ai", opts = {} },
	{ "nvim-mini/mini.align", opts = {} },
	{
		"nvim-mini/mini.surround",
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
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
}
