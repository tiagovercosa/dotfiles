return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- "tmux" ficou de fora: o branch main do nvim-treesitter não tem esse
      -- parser no registry, o que imprimia "skipping unsupported language:
      -- tmux" a cada startup. O tmux.so em site/parser sobrou da versão antiga
      -- e não pinta nada — site/queries/tmux é um symlink quebrado.
      -- markdown_inline não é um filetype: o parser markdown o injeta para o
      -- conteúdo de linha (ênfase, código inline, links). Sem ele declarado
      -- aqui, o realce inline depende do .so que sobrou da branch master e
      -- some numa instalação limpa.
      local install_langs = {
        "python", "fortran", "bibtex", "cpp", "c",
        "html", "gnuplot", "yaml", "toml", "bash",
        "lua", "vim", "vimdoc", "markdown", "markdown_inline",
      }

      local ft_patterns = {
        "python", "fortran", "bib", "cpp", "c",
        "html", "gnuplot", "yaml", "toml", "bash",
        "lua", "vim", "help", "markdown",
      }

      require("nvim-treesitter").setup()
      require("nvim-treesitter").install(install_langs)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = ft_patterns,
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang and pcall(vim.treesitter.start, args.buf, lang) then
            -- Dobras só onde existe árvore. Definir isto com vim.opt fazia o
            -- foldexpr rodar em todo buffer, inclusive nos sem parser, onde
            -- ele nunca produz dobra alguma.
            vim.opt_local.foldmethod = "expr"
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end,
      })

    end,
  },
}
