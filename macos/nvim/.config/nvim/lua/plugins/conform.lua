return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				fortran = { "fprettify" },
				tex = { "tex-fmt" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				yaml = { "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- LaTeX fica só no <leader>gf por enquanto: o tex-fmt ainda pode
			-- indentar ambientes verbatim que ele não conhece (pycode, gnuplot...).
			format_on_save = function(bufnr)
				if vim.bo[bufnr].filetype == "tex" then
					return
				end
				return { timeout_ms = 1000 }
			end,
		})

		vim.keymap.set({ "n", "x" }, "<leader>gf", function()
			require("conform").format({ async = true })
		end, { desc = "Formatar buffer/seleção" })
	end,
}
