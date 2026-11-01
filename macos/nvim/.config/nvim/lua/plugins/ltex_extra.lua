return {
	"barreiroleo/ltex_extra.nvim",
	ft = { "tex", "markdown", "plaintex", "text", "bib", "gitcommit" },
	config = function()
		local langs = { "pt-BR", "en-US" }

		-- init_check would load the dictionaries during setup(), but this plugin
		-- loads on FileType, before ltex_plus (a slow JVM start) has attached, so
		-- it fails with "Error catching ltex client". They load on LspAttach instead.
		require("ltex_extra").setup({
			load_langs = langs,
			init_check = false,
			path = vim.fn.stdpath("data") .. "/ltex",
		})

		local loaded_clients = {}

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LtexExtraSetup", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client or client.name ~= "ltex_plus" or loaded_clients[client.id] then
					return
				end
				loaded_clients[client.id] = true

				vim.diagnostic.config({
					virtual_text = false,
					virtual_lines = false,
					underline = true,
				}, vim.lsp.diagnostic.get_namespace(client.id))

				-- updateConfig looks the client up in the current buffer, which may
				-- no longer be args.buf once the server finishes starting. reload()
				-- defers the lookup, so it can't be scoped to args.buf.
				local update_config = require("ltex_extra.commands-lsp").updateConfig
				vim.api.nvim_buf_call(args.buf, function()
					for _, lang in ipairs(langs) do
						update_config("dictionary", lang)
						update_config("disabledRules", lang)
						update_config("hiddenFalsePositives", lang)
					end
				end)
			end,
		})
	end,
}
