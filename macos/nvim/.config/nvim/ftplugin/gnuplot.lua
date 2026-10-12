-- Salva e roda o script no gnuplot. Por buffer: globais, os atalhos rodavam
-- o gnuplot em qualquer arquivo. O shellescape protege caminhos com espaço.
local function run(flags)
  return function()
    vim.cmd.write()
    vim.cmd("!gnuplot " .. flags .. vim.fn.shellescape(vim.fn.expand("%"), true))
  end
end

vim.keymap.set("n", "<leader>p", run(""), { buffer = true, desc = "Executar script gnuplot" })
-- <leader>P, não <leader>o: o <leader>o é prefixo dos atalhos do Obsidian, e
-- o Neovim esperaria o timeoutlen antes de rodar.
vim.keymap.set("n", "<leader>P", run("-p "), { buffer = true, desc = "Executar gnuplot (janela persistente)" })

local undo = "exe 'silent! nunmap <buffer> <leader>p' | exe 'silent! nunmap <buffer> <leader>P'"
if vim.b.undo_ftplugin and vim.b.undo_ftplugin ~= "" then
  vim.b.undo_ftplugin = vim.b.undo_ftplugin .. " | " .. undo
else
  vim.b.undo_ftplugin = undo
end
