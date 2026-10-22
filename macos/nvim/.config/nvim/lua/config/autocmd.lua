-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	desc = "highlight selection on yank",
	callback = function()
		vim.hl.on_yank({ timeout = 200, on_visual = true })
	end,
})

-- restore cursor to file position in previous editing session (ignoring git files)
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("restore_cursor", { clear = true }),
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		if ft == "gitcommit" or ft == "gitrebase" then
			return
		end

		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			vim.schedule(function()
				vim.api.nvim_buf_call(args.buf, function()
					vim.cmd("normal! zz")
				end)
			end)
		end
	end,
})

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("help_vertical", { clear = true }),
	pattern = "help",
	callback = function()
		if vim.bo.buftype == "help" then
			vim.cmd("wincmd L")
		end
	end,
})

-- syntax highlighting for dotenv files
vim.filetype.add({
	filename = { [".env"] = "dosini" },
	pattern = { ["%.env%..*"] = "dosini" },
})
