vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<M-c>",
					accept_word = "<M-w>",
				},
			},
			filetypes = {
				yaml = true,
				markdown = true,
			},
		})
	end,
})
