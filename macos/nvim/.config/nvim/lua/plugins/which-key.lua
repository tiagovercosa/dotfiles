local wk = require("which-key")

wk.setup({
	spec = {
		{ "<leader>b", group = "Buffer" },
		{ "<leader>c", group = "Código" },
		{ "<leader>f", group = "Buscar" },
		{ "<leader>g", group = "LSP" },
		{ "<leader>h", group = "Git" },
		{ "<leader>r", group = "Renomear" },
		{ "<leader>s", group = "Split" },
	},
})

vim.keymap.set("n", "<leader>?", function()
	wk.show({ global = false })
end, { desc = "Atalhos do buffer" })
