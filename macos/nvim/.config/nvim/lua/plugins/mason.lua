return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME }
            },
          },
        },
      })
      vim.lsp.config("clangd",   { cmd = { "clangd" } })
      vim.lsp.config("fortls",   { cmd = { "fortls" } })
      vim.lsp.config("texlab", {
        cmd = { "texlab" },
        settings = {
          texlab = {
            chktex = {
              onOpenAndSave = true,
              onEdit = false,
            },
          },
        },
      })
      vim.lsp.config("marksman", { cmd = { "marksman", "server" } })
      vim.lsp.config("pyright",  { cmd = { "pyright-langserver", "--stdio" } })
      vim.lsp.config("bashls",   { cmd = { "bash-language-server", "start" } })
      vim.lsp.config("html",     { cmd = { "vscode-html-language-server", "--stdio" } })

      vim.lsp.config("ltex_plus", {
        cmd = { "ltex-ls-plus" },
        settings = {
          ltex = {
            language = "pt-BR",
            languageToolHttpServerUri = "https://api.languagetoolplus.com/",
            languageToolOrg = {
              username = vim.env.LTEX_LT_USERNAME,
              apiKey = vim.env.LTEX_LT_APIKEY,
            },
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "pyright", "clangd", "html",
          "fortls", "texlab", "marksman", "bashls",
          "ltex_plus"
        },
        automatic_enable = {
          exclude = { "ltex_plus" },
        },
      })
    end,
  },
}
