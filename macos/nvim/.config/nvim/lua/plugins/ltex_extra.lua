return {
  "barreiroleo/ltex_extra.nvim",
  ft = { "markdown", "tex", "plaintex", "bib", "text", "gitcommit" },
  config = function()
    vim.lsp.enable("ltex_plus")

    local setup_feito = false
    local clientes_carregados = {}

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LtexExtraSetup", {}),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or client.name ~= "ltex_plus" then return end

        if not setup_feito then
          setup_feito = true
          require("ltex_extra").setup({
            load_langs = { "pt-BR", "en-US" },
            init_check = false,
            path = vim.fn.stdpath("data") .. "/ltex",
          })
        end

        if not clientes_carregados[client.id] then
          clientes_carregados[client.id] = true
          vim.api.nvim_buf_call(args.buf, function()
            pcall(require("ltex_extra").reload, { "pt-BR", "en-US" })
          end)
        end
      end,
    })
  end,
}
