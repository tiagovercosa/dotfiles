require "plugins"
require "user.options"
require "user.keymaps"
require "user.cmp"

-- Plugins's config --
require("nvim-lsp-installer").setup {}

require'lspconfig'.pyright.setup{}
require"lspconfig".r_language_server.setup{}
require'lspconfig'.texlab.setup{}

require'lspconfig'.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
}

require('nvim-autopairs').setup{}
require('colorizer').setup{
  '*';
  'RGB';
  'RRGGBB';        -- #RRGGBB hex codes
  'RRGGBBAA';      -- #RRGGBBAA hex codes
  'rgb_fn';        -- CSS rgb() and rgba() functions
  'hsl_fn';        -- CSS hsl() and hsla() functions
  'css';           -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  'css_fn';
}

-- Colorscheme
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_uniform_status_lines = 1
vim.g.nord_bold_vertical_split_line = 1
vim.g.nord_uniform_diff_background = 1
vim.g.nord_bold = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1
vim.cmd[[colorscheme nord]]

-- VimWiki config
vim.cmd([[
let g:vimwiki_list = [{'path': '~/documents/repos/mywiki', 'syntax': 'markdown', 'path_html': '~/document/repos/mywiki/html_path'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_listsyms = ' ○◐●✗'
	    ]])

-- LightLine config
vim.cmd([[
let g:lightline = { 'colorscheme': 'nord'}
        ]])

-- VimTex
vim.cmd([[
let g:vimtex_view_method = 'zathura'
]])
