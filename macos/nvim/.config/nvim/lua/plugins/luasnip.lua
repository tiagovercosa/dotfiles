return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")

      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })

      require("luasnip.loaders.from_vscode").lazy_load()

      require("luasnip.loaders.from_lua").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
      })

      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { desc = "LuaSnip: next choice" })
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },
}
