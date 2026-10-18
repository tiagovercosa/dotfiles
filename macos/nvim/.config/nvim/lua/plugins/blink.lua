local prose = { "markdown", "tex", "text", "plaintex", "bib", "gitcommit" }

require("blink.cmp").setup({
  keymap = {
    preset = "super-tab",
    ["<CR>"] = { "accept", "fallback" },
    -- <C-Space> é do Things no macOS. <C-n> abre o menu e, já aberto, desce.
    ["<C-n>"] = { "show", "select_next", "fallback" },
    -- Prioridade do <Tab>: 1) menu do blink aberto; 2) gatilho de snippet
    -- manual na ponta do cursor (ref, cite, ff, link...); 3) próximo campo de
    -- snippet já aberto; 4) fallback (insere tab).
    ["<Tab>"] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      function()
        local ls = require("luasnip")
        if ls.expandable() then
          vim.schedule(ls.expand)
          return true
        end
      end,
      "snippet_forward",
      "fallback",
    },
  },

  snippets = {
    preset = "luasnip",
  },

  completion = {
    keyword = { range = "prefix" },
    menu = {
      border = "rounded",
      -- Em prosa o menu abriria a cada palavra digitada; lá ele só aparece
      -- sob demanda, com <C-n>. Exceção: no LaTeX, abre sozinho ao digitar
      -- um comando (\textbf) ou o argumento dele (\begin{ali, \ref{fig:).
      auto_show = function(ctx)
        if not vim.tbl_contains(prose, vim.bo.filetype) then
          return true
        end
        if not vim.tbl_contains({ "tex", "plaintex", "bib" }, vim.bo.filetype) then
          return false
        end
        local before = ctx.line:sub(1, ctx.cursor[2])
        return before:match("\\%a*$") ~= nil
          or before:match("\\%a+%*?%b[]{[^}]*$") ~= nil
          or before:match("\\%a+%*?{[^}]*$") ~= nil
      end,
    },
    documentation = {
      window = { border = "rounded" },
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
    },
  },
})
