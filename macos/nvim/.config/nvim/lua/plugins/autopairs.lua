return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" },
        disable_in_macro = true,
        check_ts = true,
        fast_wrap = {
          map = '<M-e>',
        },
      })

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

