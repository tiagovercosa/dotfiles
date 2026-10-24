return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local install_langs = {
			"python",
			"fortran",
			"bibtex",
			"cpp",
			"c",
			"html",
			"css",
			"gnuplot",
			"yaml",
			"toml",
			"bash",
			"lua",
			"vim",
			"vimdoc",
			"markdown",
			"markdown_inline",
			"regex",
		}

		local ft_patterns = {
			"python",
			"fortran",
			"bib",
			"cpp",
			"c",
			"html",
			"css",
			"gnuplot",
			"yaml",
			"toml",
			"bash",
			"sh",
			"lua",
			"vim",
			"help",
			"markdown",
		}
		require("nvim-treesitter").setup()
		require("nvim-treesitter").install(install_langs)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = ft_patterns,
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if lang and pcall(vim.treesitter.start, args.buf, lang) then
					vim.opt_local.foldmethod = "expr"
					vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				end
			end,
		})
	end,
}
