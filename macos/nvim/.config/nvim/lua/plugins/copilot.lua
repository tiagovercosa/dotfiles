return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	cmd = "Copilot",
	opts = {
		suggestion = {
			auto_trigger = true,
			keymap = {
				dismiss = "<M-c>",
				accept_word = "<M-w>",
			},
		},
		filetypes = {
			yaml = true,
			markdown = true,
		},
	},
}
