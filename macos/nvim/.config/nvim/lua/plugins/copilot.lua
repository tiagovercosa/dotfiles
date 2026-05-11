return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
         keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-/>",
      },
    },

    panel = { enabled = false },

    filetypes = {
      tex = true,
      latex = true,
      plaintex = true,
      markdown = true,
      ["*"] = true,
    }

  })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("copilot_keymap_fix", { clear = true }),
      callback = function(args)
        vim.schedule(function()
          local ok_client, client = pcall(require, "copilot.client")
          if not ok_client or not client.buf_is_attached(args.buf) then
            return
          end
          pcall(function()
            require("copilot.suggestion").set_keymap(args.buf)
          end)
        end)
      end,
      desc = "Re-register Copilot suggestion keymap after FileType is set",
    })
  end,
}

