local miniclue = require("mini.clue")

miniclue.setup({
  triggers = {
    -- Leader (,) and localleader (space, used by vimtex)
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },
    { mode = "n", keys = "<LocalLeader>" },
    { mode = "x", keys = "<LocalLeader>" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Brackets (]c / [c from gitsigns, ]d / [d diagnostics)
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    { mode = "n", keys = "<Leader>b", desc = "+Buffers" },
    { mode = "n", keys = "<Leader>c", desc = "+Code" },
    { mode = "n", keys = "<Leader>g", desc = "+Goto/Format" },
    { mode = "x", keys = "<Leader>g", desc = "+Format" },
    { mode = "n", keys = "<Leader>h", desc = "+Git hunks" },
    { mode = "n", keys = "<Leader>r", desc = "+Rename" },
    { mode = "n", keys = "<Leader>s", desc = "+Splits" },
    { mode = "n", keys = "<LocalLeader>l", desc = "+VimTeX" },

    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },

  window = {
    delay = 300,
    config = { width = "auto" },
  },
})
