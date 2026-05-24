-- Restore cursor position when reopening files
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
  group = last_cursor_group,
  callback = function()
    local ft = vim.bo.filetype
    if ft == "gitcommit" or ft == "gitrebase" then return end
    local last_pos = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if last_pos[1] > 0 and last_pos[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, last_pos)
    end
  end,
})

-- Highlight yanked text
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYankGroup", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

