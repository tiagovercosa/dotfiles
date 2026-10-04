return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    ---@module "ibl"
    ---@type ibl.config
    -- Highlight groups (IblIndent, IblScope, Whitespace) live in nord.lua.
    opts = {
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
      },
    },
  },
}
