-- Instalando automaticamente packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }

  print "Instalando o packer. Feche e reabra o Neovim..."
  vim.cmd [[ packadd packer.nvim ]]
end

-- Autocomando que recarrega o neovim sempre que você salva o arquivo plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- No caso do primeiro uso, uma proteção para dar erro na saída
local status_ok, packer = pcall(require, "packer")

if not status_ok then
  return
end

-- O packer usa uma janela popup
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Instalar seus plugins aqui
return packer.startup(function(use)
  use "wbthomason/packer.nvim"              -- Have packer manage itself
  use "norcalli/nvim-colorizer.lua"
  use "nvim-lualine/lualine.nvim"
  use "windwp/nvim-autopairs"               -- Autopairs, integrates with both cmp and treesitter
  use "lervag/vimtex"
  use "vimwiki/vimwiki"
  use "tpope/vim-surround"
  use "lukas-reineke/indent-blankline.nvim"
  use "fladson/vim-kitty"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Colorscheme
  use 'tiagovla/tokyodark.nvim'
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
  use "rebelot/kanagawa.nvim"
  use "arcticicestudio/nord-vim"

  -- cmp plugins
  -- use "hrsh7th/nvim-cmp" -- The completion plugin
  -- use "hrsh7th/cmp-buffer" -- buffer completions
  -- use "hrsh7th/cmp-path" -- path completions
  -- use "hrsh7th/cmp-cmdline" -- cmdline completions
  -- use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-emoji"
  -- use "hrsh7th/cmp-nvim-lua"

  -- snippets
  -- use "L3MON4D3/LuaSnip"             --snippet engine
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
end)
