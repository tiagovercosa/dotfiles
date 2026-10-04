return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = true,
      update_in_insert = false,
      always_visible = false,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local mode = {
      "mode",
      fmt = function(str)
        return "-- " .. str .. " --"
      end,
    }

    local filetype = {
      "filetype",
      icons_enabled = true,
      icon = nil,
    }

    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }

    -- Progresso do LSP (ltex_plus e basedpyright demoram a subir). O texto
    -- fica guardado aqui porque vim.lsp.status() consome as mensagens: chamado
    -- a cada redraw, voltaria vazio no refresh seguinte e piscaria.
    local lsp_progress_text = ""
    vim.api.nvim_create_autocmd("LspProgress", {
      group = vim.api.nvim_create_augroup("LualineLspProgress", {}),
      callback = function(ev)
        local status = vim.lsp.status()
        if status ~= "" then lsp_progress_text = status end
        -- ev.match vem como caminho ("<cwd>/end"), não como "end"; o tipo
        -- confiável está nos dados do evento.
        local value = ev.data and ev.data.params and ev.data.params.value
        if value and value.kind == "end" then
          vim.defer_fn(function()
            lsp_progress_text = ""
            require("lualine").refresh()
          end, 2000)
        end
        require("lualine").refresh()
      end,
    })
    local lsp_progress = {
      function() return lsp_progress_text end,
      fmt = function(str)
        -- O ltex manda "Checking document: file:///caminho/inteiro".
        str = str:gsub(":?%s*file://[^%s,]+", "")
        return #str > 40 and str:sub(1, 39) .. "…" or str
      end,
    }

    local fileformat = {
      "fileformat",
      icons_enabled = false,
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "nord",
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { branch, diff, diagnostics },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { lsp_progress, "encoding", fileformat, filetype },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
