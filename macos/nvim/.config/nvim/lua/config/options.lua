vim.cmd [[
  filetype on        " enable filetype detection
  filetype plugin on " load file-specific plugins
  filetype indent on " load file-specific indentation

  set whichwrap+=<,>,[,],h,l
]]

local options = {
  number = true,
  relativenumber = true,
  winborder = "rounded",
  cmdheight = 2,
  tabstop = 2,
  wrap = true,
  cursorline = true,
  ignorecase = true,
  shiftwidth = 2,
  smartindent = false,
  signcolumn = "yes",
  colorcolumn = "80",
  swapfile = false,
  clipboard = "unnamedplus",
  completeopt = { "menu", "menuone", "noselect" },
  shortmess = vim.opt.shortmess + "c",
  scrolloff = 5,
  expandtab = true,
  list = true,
}

for i, j in pairs(options) do
  vim.opt[i] = j
end

if vim.cmd [["termguicolors"]] then
  vim.opt.termguicolors = true
end

vim.opt.listchars = {
  space = "·",
  tab = "→ ",
  multispace = "·",
  leadmultispace = "·",
}

