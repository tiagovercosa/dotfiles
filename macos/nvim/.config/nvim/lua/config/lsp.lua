local map = vim.keymap.set

-- Servers configured in lsp/*.lua. Only the ones whose binary is installed
-- get enabled, so installing a server later is enough to activate it.
local servers = {
	"lua_ls",
	"basedpyright",
	"ruff",
	"clangd",
	"fortls",
	"html",
	"cssls",
	"bashls",
	"texlab",
	"ltex_plus",
	"marksman",
}

vim.lsp.enable(vim.tbl_filter(function(name)
	local cmd = vim.lsp.config[name].cmd
	return type(cmd) ~= "table" or vim.fn.executable(cmd[1]) == 1
end, servers))

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(ev)
		local function bopts(desc)
			return { buffer = ev.buf, silent = true, desc = desc }
		end
		map("n", "<leader>t", vim.diagnostic.open_float, bopts("Show diagnostic float"))
		map("n", "<leader>gd", vim.lsp.buf.definition, bopts("Go to definition"))
		map("n", "<leader>rn", vim.lsp.buf.rename, bopts("Rename symbol"))
		map("n", "<leader>ca", vim.lsp.buf.code_action, bopts("Code action"))
		-- Formatting (<leader>gf and on save) is handled by conform.nvim.
	end,
})
