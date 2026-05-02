return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1

      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_mode = 0

      vim.g.tex_conceal = "abdmg"
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
          vim.opt_local.conceallevel = 1
        end,
      })

      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
  },
}

