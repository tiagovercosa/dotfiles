-- Servidor (nome do nvim-lspconfig) -> pacote do mason.
local servers = {
  lua_ls       = "lua-language-server",
  basedpyright = "basedpyright",
  ruff         = "ruff",
  clangd       = "clangd",
  html         = "html-lsp",
  fortls       = "fortls",
  texlab       = "texlab",
  marksman     = "marksman",
  bashls       = "bash-language-server",
  ltex_plus    = "ltex-ls-plus",
}

-- Formatadores do conform.lua.
local formatters = { "stylua", "fprettify", "shfmt", "prettier", "tex-fmt" }

return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = vim.list_extend(vim.tbl_values(servers), formatters),
    },
    config = function(_, opts)
      local mti = require("mason-tool-installer")
      mti.setup(opts)
      -- O plugin dispara a checagem no VimEnter, que já passou quando o
      -- VeryLazy carrega; por isso a chamada direta.
      mti.run_on_start()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    -- O setup do mason põe o bin dele no PATH; tem que vir antes de qualquer
    -- servidor subir.
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            -- A library (VIMRUNTIME e plugins) fica a cargo do lazydev.lua.
            workspace = { checkThirdParty = false },
          },
        },
      })
      vim.lsp.config("texlab", {
        settings = {
          texlab = {
            chktex = {
              onOpenAndSave = true,
              onEdit = false,
            },
          },
        },
      })
      vim.lsp.config("basedpyright", {
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
        settings = { ltex = ltex_settings },
      })

      local enabled = vim.tbl_filter(function(name)
        return name ~= "ltex_plus"
      end, vim.tbl_keys(servers))
      vim.lsp.enable(enabled)
    end,
  },
}
