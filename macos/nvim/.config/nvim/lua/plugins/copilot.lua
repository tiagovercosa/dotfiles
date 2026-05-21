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
        },
      },
      panel = { enabled = false },

      filetypes = {
        tex = true,
        latex = true,
        plaintex = true,
        markdown = true,
        ["*"] = true,
      },
    })
  end,
}

