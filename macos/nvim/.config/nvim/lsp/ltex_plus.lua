-- LTeX identifies documents by its own language IDs, not Neovim filetypes:
-- a buffer sent as "tex" is skipped, it has to be "latex". (This mapping used
-- to come from nvim-lspconfig's ltex_plus config.)
local language_ids = {
  bib = "bibtex",
  plaintex = "tex",
  tex = "latex",
  text = "plaintext",
}

local filetypes = { "markdown", "tex", "plaintex", "bib", "text", "gitcommit" }

local ltex_settings = {
  enabled = vim.tbl_map(function(ft)
    return language_ids[ft] or ft
  end, filetypes),
  language = "pt-BR",
  checkFrequency = "save",
  diagnosticSeverity = "hint",
}

-- LanguageTool Premium, with credentials exported by ~/.config/zsh/local.zsh
-- (sourced by .zshrc, so only Neovim started from an interactive shell has them).
local lt_user = vim.env.LTEX_LT_USERNAME
local lt_key = vim.env.LTEX_LT_APIKEY
if lt_user and lt_user ~= "" and lt_key and lt_key ~= "" then
  ltex_settings.languageToolHttpServerUri = "https://api.languagetoolplus.com/"
  ltex_settings.languageToolOrg = {
    username = lt_user,
    apiKey = lt_key,
  }
end

---@type vim.lsp.Config
return {
  cmd = { "ltex-ls-plus" },
  filetypes = filetypes,
  root_markers = { ".git" },
  get_language_id = function(_, filetype)
    return language_ids[filetype] or filetype
  end,
  settings = { ltex = ltex_settings },
}
