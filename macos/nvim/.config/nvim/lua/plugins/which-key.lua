return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@module "which-key"
    ---@type wk.Opts
    opts = {
      spec = {
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Código" },
        { "<leader>f", group = "Buscar" },
        { "<leader>g", group = "LSP" },
        { "<leader>h", group = "Git" },
        { "<leader>r", group = "REPL / Renomear" },
        { "<leader>s", group = "Split" },
      },
    },
    keys = {
      {
        "<leader>?",
        function() require("which-key").show({ global = false }) end,
        desc = "Atalhos do buffer",
      },
    },
  },
}
