return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config

    config = function ()
      -- Highlight groups (IblIndent, IblScope, Whitespace) live in nord.lua.
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
