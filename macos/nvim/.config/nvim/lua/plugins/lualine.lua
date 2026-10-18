local theme = vim.deepcopy(require("lualine.themes.nord"))
for _, mode in pairs(theme) do
	for name, section in pairs(mode) do
		if name == "a" then
			section.fg = section.bg
		end
		section.bg = "NONE"
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "|", right = "" },
		section_separators = { left = "|", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16,
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

-- Lualine groups without bg fall back to StatusLine/StatusLineNC, which nord
-- paints even with transparent = true. Reapplied on every colorscheme change.
local function transparent_statusline()
	for _, name in ipairs({ "StatusLine", "StatusLineNC" }) do
		local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
		hl.bg = "NONE"
		vim.api.nvim_set_hl(0, name, hl)
	end
end

transparent_statusline()
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("TransparentStatusline", { clear = true }),
	callback = transparent_statusline,
})
