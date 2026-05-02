return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" },
        disable_in_macro = true,
        check_ts = true,
        fast_wrap = {
          map = '<M-e>',
        },
      })
    end
  }
}

