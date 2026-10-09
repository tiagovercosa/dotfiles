return {
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
      -- Notificação no canto superior direito com ícone, título e horário.
      render = "default",
      stages = "fade",
      timeout = 3000,
      max_width = 60,
      -- O nord está com fundo transparente; o notify precisa de uma cor real
      -- para calcular o fade (Polar Night do nord).
      background_colour = "#2E3440",
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        -- Markdown do LSP renderizado com treesitter nas janelas do noice.
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
        -- A assinatura já é mostrada pelo blink.cmp.
        signature = { enabled = false },
      },
      presets = {
        command_palette = true, -- cmdline e popup de completar juntos, no topo
        long_message_to_split = true, -- mensagens longas vão para um split
        lsp_doc_border = true, -- borda no hover do LSP
      },
    },
    keys = {
      { "<leader>nh", "<cmd>Noice telescope<cr>", desc = "Notification history" },
      { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss notifications" },
    },
  },
}
