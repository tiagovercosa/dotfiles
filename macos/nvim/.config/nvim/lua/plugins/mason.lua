-- Servidores (configurados em lsp/*.lua) e formatadores (do conform.lua)
-- instalados pelo mason. O mason.setup() põe o bin dele no PATH, por isso
-- precisa rodar antes do config.lsp.
local packages = {
  -- LSP
  "lua-language-server",
  "basedpyright",
  "ruff",
  "clangd",
  "html-lsp",
  "css-lsp",
  "fortls",
  "texlab",
  "marksman",
  "bash-language-server",
  "ltex-ls-plus",

  -- Formatadores
  "stylua",
  "fprettify",
  "shfmt",
  "prettier",
  "tex-fmt",
}

require("mason").setup()

require("mason-tool-installer").setup({
  ensure_installed = packages,
})
