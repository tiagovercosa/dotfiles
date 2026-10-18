---@type vim.lsp.Config
return {
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_markers = { ".latexmkrc", "latexmkrc", ".texlabroot", "texlabroot", ".git" },
  settings = {
    texlab = {
      chktex = {
        onOpenAndSave = true,
        onEdit = false,
      },
    },
  },
}
