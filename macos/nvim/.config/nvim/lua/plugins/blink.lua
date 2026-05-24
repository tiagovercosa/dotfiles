return {
  {
    "saghen/blink.cmp",
    version = "*",

    dependencies = {
      "L3MON4D3/LuaSnip",
      "zbirenbaum/copilot.lua",
      "giuxtaposition/blink-cmp-copilot"
    },

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
        kind_icons = {
          Copilot = "",
          Text = '󰉿',
          Method = '󰊕',
          Function = '󰊕',
          Constructor = '󰒓',

          Field = '󰜢',
          Variable = '󰆦',
          Property = '󰖷',

          Class = '󱡠',
          Interface = '󱡠',
          Struct = '󱡠',
          Module = '󰅩',

          Unit = '󰪚',
          Value = '󰦨',
          Enum = '󰦨',
          EnumMember = '󰦨',

          Keyword = '󰻾',
          Constant = '󰏿',

          Snippet = '󱄽',
          Color = '󰏘',
          File = '󰈔',
          Reference = '󰬲',
          Folder = '󰉋',
          Event = '󱐋',
          Operator = '󰪚',
          TypeParameter = '󰬛',
        },
      },

      snippets = {
        preset = "luasnip",
      },

      completion = {
        keyword = { range = 'prefix' },
        menu = { border = "rounded" },
        documentation = {
          window = { border = "rounded" }
        },
        ghost_text = { enabled = true },
      },

      signature = {
        enabled = true,
        window = { border = "rounded" },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        per_filetype = {
          markdown = { "lsp", "path", "snippets", "buffer" },
          tex      = { "lsp", "path", "snippets", "buffer" },
          text     = { "lsp", "path", "snippets", "buffer" },
          plaintex = { "lsp", "path", "snippets", "buffer" },
          bib      = { "lsp", "path", "snippets", "buffer" },
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
        },
      },
    },
  },
}
