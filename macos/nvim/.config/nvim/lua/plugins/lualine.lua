return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }

      local diff = {
        "diff",
        colored = true,
        symbols = { added = " ", modified = " ", removed = " " },
      }

      local mode = {
        "mode",
        fmt = function(str)
          return "-- " .. str .. " --"
        end,
      }

      local filetype = {
        "filetype",
        icons_enabled = true,
        icon = nil,
      }

      local branch = {
        "branch",
        icons_enabled = true,
        icon = "",
      }

      local fileformat = {
        "fileformat",
        icons_enabled = false,
      }

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "nord",
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { branch, diff, diagnostics },
          lualine_c = { { "filename", path = 1 } },
		      lualine_x = { "encoding", fileformat, filetype },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
