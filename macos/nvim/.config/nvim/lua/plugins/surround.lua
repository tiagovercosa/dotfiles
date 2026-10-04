-- ys{motion}{char} adiciona, ds{char} apaga, cs{velho}{novo} troca; S no
-- visual. No .tex os mapeamentos do vimtex com a mesma gramática (dse, cse,
-- dsc, csc, ds$, cs$, dsd, csd) continuam valendo: são por buffer e vencem.
-- Por isso aqui o tex só ganha como *adicionar* comando e ambiente, que o
-- vimtex não tem para um movimento.
local function tex_setup(buf)
  local config = require("nvim-surround.config")
  vim.api.nvim_buf_call(buf, function()
    require("nvim-surround").buffer_setup({
      surrounds = {
        -- ysiwc + "textbf" -> \textbf{palavra}
        c = {
          add = function()
            local cmd = config.get_input("Comando: ")
            if cmd and cmd ~= "" then
              return { { "\\" .. cmd .. "{" }, { "}" } }
            end
          end,
        },
        -- ySSe/gSe + "itemize" -> \begin{itemize} ... \end{itemize}, nas
        -- próprias linhas. ysiwe deixa tudo na mesma linha.
        e = {
          add = function()
            local env = config.get_input("Ambiente: ")
            if env and env ~= "" then
              return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
            end
          end,
        },
      },
    })
  end)
end

return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("SurroundTex", {}),
        pattern = "tex",
        callback = function(args) tex_setup(args.buf) end,
      })
      -- Carrega no VeryLazy: o FileType do arquivo aberto na linha de comando
      -- já passou.
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == "tex" then
          tex_setup(buf)
        end
      end
    end,
  },
}
