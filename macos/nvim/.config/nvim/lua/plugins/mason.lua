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
      -- basedpyright cuida SÓ da verificação de tipos; o lint (import/variável
      -- não usados, nome indefinido) fica com o ruff, para não duplicar.
      vim.lsp.config("basedpyright", {
        cmd = { "basedpyright-langserver", "--stdio" },
        settings = {
          basedpyright = {
            -- lspconfig força true, o que transforma o hint esmaecido de
            -- "não utilizado" em warning cheio. false devolve o esmaecido.
            disableTaggedHints = false,
            analysis = {
              -- O padrão do basedpyright é "recommended", bem mais estrito que
              -- o "standard" do pyright: exige anotação em tudo e inunda a tela
              -- com "Type of X is unknown".
              typeCheckingMode = "standard",
              diagnosticSeverityOverrides = {
                -- já cobertos pelo ruff (F401, F841, F821)
                reportUnusedImport = "none",
                reportUnusedVariable = "none",
                reportUndefinedVariable = "none",
                -- erro por padrão; vira ruído quando o venv não é detectado
                reportMissingImports = "warning",
              },
            },
          },
        },
      })

      -- Lint + formatação. É o único servidor Python com documentFormatting,
      -- ou seja, <leader>gf em .py depende dele.
      vim.lsp.config("ruff", { cmd = { "ruff", "server" } })
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
          "lua_ls", "basedpyright", "ruff", "clangd",
          "html", "fortls", "texlab", "marksman",
          "bashls", "ltex_plus"
        },
        automatic_enable = {
          exclude = { "ltex_plus" },
        },
      })
    end,
  },
}
