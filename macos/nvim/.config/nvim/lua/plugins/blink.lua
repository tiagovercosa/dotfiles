return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
      "L3MON4D3/LuaSnip",
    },

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" },
        -- <C-Space> é do Things no macOS. <C-n> abre o menu e, já aberto, desce.
        ["<C-n>"] = { "show", "select_next", "fallback" },
      },

      snippets = {
        preset = "luasnip",
      },

      completion = {
        keyword = { range = 'prefix' },
        menu = {
          border = "rounded",
          -- Em prosa o menu abre a cada palavra digitada; lá ele só aparece
          -- sob demanda, com <C-n>. Exceção: numa nota do Obsidian, abre
          -- sozinho ao digitar [[link ou #tag.
          auto_show = function(ctx)
            if not vim.tbl_contains(
              { "markdown", "tex", "text", "plaintex", "bib", "gitcommit" },
              vim.bo.filetype
            ) then
              return true
            end
            if not vim.b.obsidian_buffer then return false end
            local before = ctx.line:sub(1, ctx.cursor[2])
            return before:match("%[%[[^%]]*$") ~= nil
              or before:match("%f[%S]#[^%s#]+$") ~= nil
          end,
        },
        documentation = {
          window = { border = "rounded" }
        },
      },

      signature = {
        enabled = true,
        window = { border = "rounded" },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          markdown = { "lsp", "path", "snippets" },
          tex      = { "lsp", "path", "snippets" },
          text     = { "lsp", "path", "snippets" },
          plaintex = { "lsp", "path", "snippets" },
          bib      = { "lsp", "path", "snippets" },
          lua      = { inherit_defaults = true, "lazydev" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- Acima do lua_ls, que sugere os mesmos módulos sem os tipos.
            score_offset = 100,
          },
        },
      },
    },
  },
}
