return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.setup({
        disable_filetype = { "TelescopePrompt", "vim" },
        disable_in_macro = true,
        check_ts = true,
        fast_wrap = {
          map = '<M-e>',
        },
        -- O <BS> do autopairs é por buffer e apagava o do markdown-plus (que
        -- remove o marcador de lista). Global, ele vira o fallback que o
        -- markdown-plus chama fora de lista, e os dois funcionam.
        map_bs = false,
      })

      vim.keymap.set("i", "<BS>", function()
        return npairs.autopairs_bs()
      end, { expr = true, replace_keycodes = false, desc = "autopairs delete" })

      npairs.add_rules {
        Rule(' ', ' ')
        :with_pair(function (opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({ '()', '[]', '{}' }, pair)
        end),
        Rule('( ', ' )')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
        Rule('{ ', ' }')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
        Rule('[ ', ' ]')
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']')
      }
    end
  }
}

