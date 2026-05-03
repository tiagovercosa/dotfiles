return {
  "barreiroleo/ltex_extra.nvim",
  ft = { "markdown", "tex" },
  config = function()
    require("ltex_extra").setup({
      load_langs = { "pt-BR", "en-US" },
      init_check = false,
      path = vim.fn.stdpath("data") .. "/ltex",
      server_start = false,
    })

    vim.lsp.config("ltex_plus", {
      cmd = { "ltex-ls-plus" },
      settings = {
        ltex = {
          language = { "pt-BR", "en-US" },
          languageToolHttpServerUri = "https://api.languagetoolplus.com/",
          languageToolOrganizationId = "OrganizationId",
          languageToolApiKey = "API-KEY",
        },
      },
      on_attach = function(client, bufnr)
        require("ltex_extra").reload({ "pt-BR", "en-US" })
      end,
    })
    vim.lsp.enable("ltex_plus")
  end,
}
