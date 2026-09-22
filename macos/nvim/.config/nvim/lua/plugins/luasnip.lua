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
        -- rep() nodes update while typing, not only when leaving insert mode
        update_events = "TextChanged,TextChangedI",
        -- In visual mode, <Tab> cuts the selection so the next snippet can wrap
        -- it (see get_visual in lua/utils/snippets.lua)
        store_selection_keys = "<Tab>",
        -- Leave a snippet once insert mode starts outside it, so blink's <Tab>
        -- doesn't jump back into old snippets (what `history = true` allowed)
        region_check_events = "InsertEnter",
        delete_check_events = "TextChanged",
      })

      require("luasnip.loaders.from_vscode").lazy_load({
        exclude = { "tex", "latex" },
      })

      require("luasnip.loaders.from_lua").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
      })

      vim.keymap.set({ "i", "s" }, "<M-j>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { desc = "LuaSnip: next choice" })
    end,
  },
}
