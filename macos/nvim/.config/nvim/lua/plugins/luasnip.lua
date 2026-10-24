return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		enable_autosnippets = true,
		store_selection_keys = "<Tab>",
	},
	config = function(_, opts)
		require("luasnip").setup(opts)

		require("luasnip.loaders.from_vscode").lazy_load({
			exclude = { "tex", "latex" },
		})

		require("luasnip.loaders.from_lua").lazy_load({
			paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
		})
	end,
}
