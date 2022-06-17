require "plugins"
require "user.options"
require "user.keymaps"
require "user.cmp"
require "user.lspconfig"

-- Config Plugins
require "plug-config.markdown"
require "plug-config.vimtex"
require "plug-config.lualine"
require "plug-config.colorizer"
require "plug-config.autopairs"
require "plug-config.vimwiki"
require "plug-config.surround"
require "plug-config.colorscheme"
require "plug-config.nvimtree"

require("luasnip.loaders.from_vscode").lazy_load()

