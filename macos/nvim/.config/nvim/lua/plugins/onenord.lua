return {
  "rmehri01/onenord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onenord").setup({
      theme = nil,
      borders = true,
      face_nc = true,
      styles = {
        comments = "italic",
        strings = "none",
        keywords = "italic,bold",
        functions = "bold",
        variables = "none",
        diagnostics = "underline",
      },
      disable = {
        background = true,
        cursorline = false,
        eob_lines = true,
      },
    })
    vim.cmd.colorscheme("onenord")
  end,
}
