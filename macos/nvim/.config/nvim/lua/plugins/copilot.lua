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
        hide_during_completion = true,
        keymap = {
          accept = "<M-y>",
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

    -- hide_during_completion só enxerga o menu nativo (pumvisible); o do
    -- blink.cmp precisa avisar por conta própria.
    local group = vim.api.nvim_create_augroup("CopilotBlink", {})
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "BlinkCmpMenuOpen",
      callback = function() vim.b.copilot_suggestion_hidden = true end,
    })
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "BlinkCmpMenuClose",
      callback = function() vim.b.copilot_suggestion_hidden = false end,
    })
  end,
}

