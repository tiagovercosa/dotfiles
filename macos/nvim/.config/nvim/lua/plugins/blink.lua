return {
  {
    "saghen/blink.cmp",
    version = "*",

    dependencies = {
      "L3MON4D3/LuaSnip",
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
        -- Desligado (que é o default do blink): quem desenha ghost text aqui
        -- é o copilot.lua. Com os dois ligados o texto sai sobreposto, porque
        -- o hide_during_completion do copilot só detecta o popup nativo
        -- (vim.fn.pumvisible), não a janela flutuante do blink.
        ghost_text = { enabled = false },
      },

      signature = {
        enabled = true,
        window = { border = "rounded" },
      },

      sources = {
        -- Copilot não entra aqui de propósito: a sugestão dele é inline
        -- (copilot.lua, aceita com <M-l>), para não aparecer em dois lugares.
        default = { "lsp", "path", "snippets", "buffer" },
        -- Em arquivos de texto puro o "buffer" só repete palavras já digitadas
        -- no documento; fica de fora e sobram LSP (comandos, referências),
        -- caminhos e snippets.
        per_filetype = {
          markdown = { "lsp", "path", "snippets" },
          tex      = { "lsp", "path", "snippets" },
          text     = { "lsp", "path", "snippets" },
          plaintex = { "lsp", "path", "snippets" },
          bib      = { "lsp", "path", "snippets" },
        },
      },
    },
  },
}
