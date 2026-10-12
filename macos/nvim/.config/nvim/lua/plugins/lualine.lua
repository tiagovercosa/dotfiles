-- Progresso do LSP (ltex_plus e basedpyright demoram a subir). O texto
-- fica guardado aqui porque vim.lsp.status() consome as mensagens: chamado
-- a cada redraw, voltaria vazio no refresh seguinte e piscaria.
local function lsp_progress()
  local text, generation = "", 0
  local function refresh()
    require("lualine").refresh()
  end
  vim.api.nvim_create_autocmd("LspProgress", {
    group = vim.api.nvim_create_augroup("LualineLspProgress", {}),
    callback = function(ev)
      local status = vim.lsp.status()
      if status ~= "" then
        text = status
      end
      generation = generation + 1
      -- ev.match vem como caminho ("<cwd>/end"), não como "end"; o tipo
      local value = ev.data and ev.data.params and ev.data.params.value
      if value and value.kind == "end" then
        local current = generation
        vim.defer_fn(function()
          if generation == current then
            text = ""
            refresh()
          end
        end, 2000)
      end
      refresh()
    end,
  })

  return {
    function()
      return text
    end,
    fmt = function(str)
      -- O ltex manda "Checking document: file:///caminho/inteiro".
      str = str:gsub(":?%s*file://[^%s,]+", "")
      if vim.fn.strchars(str) > 40 then
        return vim.fn.strcharpart(str, 0, 39) .. "…"
      end
      return str
    end,
  }
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local branch = { "branch", icon = "" }

    local diff = {
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
    }

    return {
      options = {
        theme = "nord",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { branch, diff, diagnostics },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          lsp_progress(),
          "encoding",
          { "fileformat", icons_enabled = false },
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    }
  end,
}
