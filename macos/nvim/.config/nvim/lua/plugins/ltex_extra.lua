return {
  "barreiroleo/ltex_extra.nvim",
  ft = { "markdown", "tex" },
  config = function()
    vim.lsp.enable("ltex_plus")

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "ltex_plus" then
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
