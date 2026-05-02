return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "python", "fortran", "bibtex", "cpp", "c",
          "html", "gnuplot", "yaml", "toml", "tmux",
          "bash", "sh"
        },
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang then
            pcall(vim.treesitter.start, args.buf, lang)
          end
        end,
      })

      -- vim.opt.foldmethod = "expr"
      -- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    end,
  },
}
