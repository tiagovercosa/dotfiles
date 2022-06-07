require "plugins"
require "user.options"
require "user.keymaps"
-- require "user.cmp"

-- Plugins's config --
require("nvim-lsp-installer").setup {}
require'lspconfig'.pyright.setup{}
require"lspconfig".r_language_server.setup{}
require'lspconfig'.clangd.setup{}
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
-- vim.g.tokyodark_transparent_background = false
-- vim.g.tokyodark_enable_italic_comment = true
-- vim.g.tokyodark_enable_italic = true
-- vim.g.tokyodark_color_gamma = "1.0"
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_uniform_status_lines = 1
vim.g.nord_bold_vertical_split_line = 1
vim.g.nord_uniform_diff_background = 1
vim.g.nord_bold = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1
vim.cmd("colorscheme nord")

-- LunaLine
local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}
local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}
require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
	lualine_b = { branch, diagnostics },
	},
}

-- VimWiki config
vim.cmd([[
let g:vimwiki_list = [{'path': '~/doc/repos/mywiki', 'syntax': 'markdown', 'path_html': '~/doc/repos/mywiki/html_path'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_listsyms = ' ○◐●✗'
	    ]])

-- VimTex
vim.cmd([[
let g:vimtex_view_method = 'zathura'
]])
