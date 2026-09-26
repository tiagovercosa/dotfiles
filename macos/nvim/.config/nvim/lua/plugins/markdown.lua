return {
  {
    "YousefHadder/markdown-plus.nvim",
    ft = "markdown",
    opts = {
      keymaps = { enabled = true },
      table = {
        keymaps = {
          enabled = true,
          insert_mode_navigation = false,
        },
      },
      features = { html_block_awareness = true },
      list = { smart_outdent = true },
    },
  },
}
