return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local install_langs = {
        "python", "fortran", "bibtex", "cpp", "c",
        "html", "gnuplot", "yaml", "toml", "tmux",
        "bash", "lua", "vim", "vimdoc", "markdown",
      }

      local ft_patterns = {
        "python", "fortran", "bib", "cpp", "c",
        "html", "gnuplot", "yaml", "toml", "tmux",
        "bash", "lua", "vim", "help", "markdown",
      }

      require("nvim-treesitter").setup()
      require("nvim-treesitter").install(install_langs)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = ft_patterns,
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang then
            pcall(vim.treesitter.start, args.buf, lang)
          end
        end,
      })

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    end,
  },
}
