return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      enabled = true,

      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        keymap = {
          accept = "<M-l>",
          accept_word = "<M-w>",
        },
      },
      panel = { enabled = false },

      filetypes = {
        markdown = true,
        tex = true,
        text = true,
        plaintex = true,
        bib = true,
        python = true,
        c = true,
        cpp = true,
        fortran = true,
        lua = true,
        ["*"] = false,
      },
    })
  end,
}

