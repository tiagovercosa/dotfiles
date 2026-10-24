return {
	"barreiroleo/ltex_extra.nvim",
	ft = { "tex", "markdown", "plaintex", "text", "bib", "gitcommit" },
	config = function()
		require("ltex_extra").setup({
			load_langs = { "pt-BR", "en-US" },
			path = vim.fn.stdpath("data") .. "/ltex",
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LtexExtraSetup", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.name == "ltex_plus" then
					vim.diagnostic.config({
						virtual_text = false,
						virtual_lines = false,
						underline = true,
					}, vim.lsp.diagnostic.get_namespace(client.id))
				end
			end,
		})
	end,
}
