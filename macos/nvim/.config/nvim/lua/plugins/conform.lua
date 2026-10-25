return {
	"stevearc/conform.nvim",
	event = "BufReadPre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "x" },
			desc = "Formatar buffer/seleção",
		},
	},
	opts = {
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
	},
}
