vim.opt_local.conceallevel = 2

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("vimtex_event_focus", {}),
  pattern = "VimtexEventView",
  callback = function()
    vim.system({ "osascript", "-e", 'tell application "Ghostty" to activate' })
  end,
})

local undo = "setlocal conceallevel<"
if vim.b.undo_ftplugin and vim.b.undo_ftplugin ~= "" then
  vim.b.undo_ftplugin = vim.b.undo_ftplugin .. " | " .. undo
else
  vim.b.undo_ftplugin = undo
end
