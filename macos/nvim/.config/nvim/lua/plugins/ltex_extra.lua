local setup_feito = false
local clientes_carregados = {}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LtexExtraSetup", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "ltex_plus" then
      return
    end

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
      vim.diagnostic.config({
        -- No text beside the line: sign column icon (global signs from
        -- options.lua) plus the red undercurl set in colorscheme.lua.
        virtual_text = false,
        virtual_lines = false,
        underline = true,
      }, vim.lsp.diagnostic.get_namespace(client.id))
      vim.api.nvim_buf_call(args.buf, function()
        pcall(require("ltex_extra").reload, { "pt-BR", "en-US" })
      end)
    end
  end,
})
