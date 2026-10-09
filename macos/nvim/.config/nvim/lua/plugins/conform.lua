-- Formatação por filetype. Onde não há formatador listado (C, C++, ...), cai
-- no formatador do LSP, como o antigo vim.lsp.buf.format.
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>gf",
        function() require("conform").format({ async = true }) end,
        mode = { "n", "x" },
        desc = "Formatar buffer/seleção",
      },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        lua      = { "stylua" },
        python   = { "ruff_format" },
        fortran  = { "fprettify" },
        tex      = { "tex-fmt" },
        sh       = { "shfmt" },
        bash     = { "shfmt" },
        markdown = { "prettier" },
        html     = { "prettier" },
        yaml     = { "prettier" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- LaTeX fica só no <leader>gf por enquanto: o tex-fmt ainda pode
      -- indentar ambientes verbatim que ele não conhece (pycode, gnuplot...).
      format_on_save = function(bufnr)
        if vim.bo[bufnr].filetype == "tex" then return end
        return { timeout_ms = 1000 }
      end,
      formatters = {
        -- Quebra as linhas em 100 colunas só ao formatar (<leader>gf); o
        -- padrão é 80.
        ["tex-fmt"] = {
          prepend_args = { "--wraplen", "100" },
        },
      },
    },
  },
}
