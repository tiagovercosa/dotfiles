-- Servidores (configurados em lsp/*.lua) e formatadores (do conform.lua)
-- instalados pelo mason.

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

return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = packages,
    })
  end,
}
