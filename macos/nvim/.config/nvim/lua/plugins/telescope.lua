return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local themes = require("telescope.themes")

		telescope.setup({
			defaults = {
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						width = 0.5,
						mirror = false,
					},
				},
				-- Arquivos auxiliares do LaTeX
				file_ignore_patterns = { "%.aux", "%.log", "%.out" },
			},
			extensions = {
				-- vim.ui.select (code actions, etc.) num dropdown do telescope
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		})

		-- Native fzf sorter (compiled by the PackChanged hook in plugins/init.lua)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Telescope config files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fx", builtin.diagnostics, { desc = "Telescope diagnostics" })
	end,
}
