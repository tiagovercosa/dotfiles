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

    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull \\\\hbox",
      "Overfull \\\\hbox",
      "LaTeX Warning: .\\+ float specifier changed to",
      "LaTeX hooks Warning",
      'Package siunitx Warning: Detected the "physics" package:',
      "Package hyperref Warning: Token not allowed in a PDF string",
    }

    vim.g.vimtex_compiler_latexmk = {
      out_dir = "build",
      options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      hooks = {},
    }
  end,
}
