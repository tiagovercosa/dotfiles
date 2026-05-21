return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      enabled = true,

      suggestion = { enabled = false },
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

