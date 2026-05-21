return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 0
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_fold_enabled = 1
    vim.g.tex_flavor = "latex"
    vim.g.tex_conceal = "abdmg"

    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",
      options = {
        "-lualatex",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-outdir=.",
      },
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      hooks = {},
    }
  end,
}

