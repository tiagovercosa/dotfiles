-- Soft-wrap prose: long lines wrap at word boundaries and keep their indent,
-- without inserting real line breaks (options.lua keeps wrap off globally).
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true

local undo = "setlocal wrap< linebreak< breakindent<"
if vim.b.undo_ftplugin and vim.b.undo_ftplugin ~= "" then
  vim.b.undo_ftplugin = vim.b.undo_ftplugin .. " | " .. undo
else
  vim.b.undo_ftplugin = undo
end
