return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
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
      vim.lsp.config("basedpyright", {
        cmd = { "basedpyright-langserver", "--stdio" },
        settings = {
          basedpyright = {
            disableTaggedHints = false,
            analysis = {
              typeCheckingMode = "standard",
              diagnosticSeverityOverrides = {
                reportUnusedImport = "none",
                reportUnusedVariable = "none",
                reportUndefinedVariable = "none",
                reportMissingImports = "warning",
              },
            },
          },
        },
      })

      vim.lsp.config("ruff", { cmd = { "ruff", "server" } })
      vim.lsp.config("bashls",   { cmd = { "bash-language-server", "start" } })
      vim.lsp.config("html",     { cmd = { "vscode-html-language-server", "--stdio" } })

      local ltex_settings = { language = "pt-BR" }

      local lt_user = vim.env.LTEX_LT_USERNAME
      local lt_key = vim.env.LTEX_LT_APIKEY
      if lt_user and lt_user ~= "" and lt_key and lt_key ~= "" then
        ltex_settings.languageToolHttpServerUri = "https://api.languagetoolplus.com/"
        ltex_settings.languageToolOrg = {
          username = "${LTEX_LT_USERNAME}",
          apiKey = "${LTEX_LT_APIKEY}",
        }
      end

      vim.lsp.config("ltex_plus", {
        cmd = { "ltex-ls-plus" },
        settings = { ltex = ltex_settings },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "basedpyright", "ruff", "clangd",
          "html", "fortls", "texlab", "marksman",
          "bashls", "ltex_plus"
        },
        automatic_enable = {
          -- copilot: o copilot.lua já sobe o próprio servidor. Sem isto o
          -- mason-lspconfig sobe um segundo, que ninguém consome.
          exclude = { "ltex_plus", "copilot" },
        },
      })
    end,
  },
}
