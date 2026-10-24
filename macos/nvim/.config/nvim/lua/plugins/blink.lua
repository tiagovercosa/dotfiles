return {
	"saghen/blink.cmp",
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "super-tab" },
		snippets = { preset = "luasnip" },
		signature = { enabled = true },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				markdown = { "lsp", "path", "snippets" },
				tex = { "lsp", "path", "snippets" },
				text = { "lsp", "path", "snippets" },
				plaintex = { "lsp", "path", "snippets" },
				bib = { "lsp", "path", "snippets" },
			},
		},
	},
}
