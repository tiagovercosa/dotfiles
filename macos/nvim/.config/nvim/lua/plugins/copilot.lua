return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
         keymap = {
          accept = "<C-l>",
          accept_word = false,
          acept_line = false,
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-/>",
      },
      panel = { enabled = false },
    }
  })
  end,
}

