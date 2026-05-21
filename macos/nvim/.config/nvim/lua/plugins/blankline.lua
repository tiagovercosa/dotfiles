return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config

    config = function ()
      vim.api.nvim_set_hl(0, "Whitespace", { fg = "#4C566A" })
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#4C566A" })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#88C0D0" })

      require("ibl").setup({
        indent = {
          char = "│",
        },
        scope = {
          enabled = true,
          char = "│",
          show_start = false,
          show_end = false,
      },
      whitespace = {
        highlight = { "Whitespace" },
        remove_blankline_trail = false,
      }
    })
    end
  }
}
