return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")

      luasnip.config.set_config({
        enable_autosnippets = true,
        update_events = "TextChanged,TextChangedI",
        store_selection_keys = "<Tab>",
        region_check_events = "InsertEnter",
        delete_check_events = "TextChanged",
      })

      require("luasnip.loaders.from_vscode").lazy_load({
        exclude = { "tex", "latex" },
      })

      require("luasnip.loaders.from_lua").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
      })

      vim.keymap.set({ "i", "s" }, "<M-n>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { desc = "LuaSnip: next choice" })
    end,
  },
}
