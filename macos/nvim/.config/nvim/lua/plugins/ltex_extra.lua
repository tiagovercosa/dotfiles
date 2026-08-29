return {
  "barreiroleo/ltex_extra.nvim",
  ft = { "markdown", "tex" },
  config = function()
    vim.lsp.enable("ltex_plus")

    -- O LspAttach dispara por buffer, mas o ltex_extra é global: sem este
    -- guarda o setup rodava de novo a cada arquivo aberto, relendo os
    -- dicionários do disco e disparando didChangeConfiguration concorrentes.
    local ja_configurado = false

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LtexExtraSetup", {}),
      callback = function(args)
        if ja_configurado then return end
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "ltex_plus" then
          ja_configurado = true
          require("ltex_extra").setup({
            load_langs = { "pt-BR", "en-US" },
            init_check = true,
            path = vim.fn.stdpath("data") .. "/ltex",
          })
        end
      end,
    })
  end,
}
