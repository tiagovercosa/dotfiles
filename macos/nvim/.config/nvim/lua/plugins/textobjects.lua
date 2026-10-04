-- Objetos de texto conscientes da sintaxe: função, classe, argumento e laço
-- viram alvos de operador, como `ip` é para parágrafo. Usa a mesma árvore do
-- nvim-treesitter, por isso acompanha a branch main dele.
return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          -- Salta para o próximo objeto quando o cursor está antes dele, em
          -- vez de falhar. `daf` com o cursor numa linha em branco acima da
          -- função apaga a função seguinte.
          lookahead = true,
          selection_modes = {
            -- Função e classe saem por linha inteira: `daf` não deixa a
            -- indentação órfã para trás.
            ["@function.outer"] = "V",
            ["@class.outer"] = "V",
            ["@parameter.outer"] = "v",
          },
        },
        move = {
          set_jumps = true,
        },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      -- Mapeamentos por buffer, só onde a linguagem tem query de textobjects.
      -- Globais, eles ocupavam ic/ac também no .tex, e o vimtex não cria um
      -- mapeamento quando a tecla já está tomada: o dac/dic dele (comando
      -- LaTeX) sumia, trocado por um "classe" que no tex não faz nada.
      local function attach(buf)
        local function map(modes, lhs, fn, desc)
          vim.keymap.set(modes, lhs, fn, { buffer = buf, desc = desc })
        end
        local function sel(lhs, query, desc)
          map({ "x", "o" }, lhs, function()
            select.select_textobject(query, "textobjects")
          end, desc)
        end

        sel("af", "@function.outer", "Função (com assinatura)")
        sel("if", "@function.inner", "Função (só o corpo)")
        sel("ac", "@class.outer", "Classe (inteira)")
        sel("ic", "@class.inner", "Classe (só o corpo)")
        sel("aa", "@parameter.outer", "Argumento (com a vírgula)")
        sel("ia", "@parameter.inner", "Argumento (só o valor)")
        sel("al", "@loop.outer", "Laço (inteiro)")
        sel("il", "@loop.inner", "Laço (só o corpo)")

        -- Movimento: só função. `]]`/`[[` e `]m`/`[m` ficam de fora porque os
        -- ftplugins do runtime (python, entre outros) já os mapeiam por buffer.
        map({ "n", "x", "o" }, "]f", function()
          move.goto_next_start("@function.outer", "textobjects")
        end, "Próxima função")
        map({ "n", "x", "o" }, "[f", function()
          move.goto_previous_start("@function.outer", "textobjects")
        end, "Função anterior")
        map({ "n", "x", "o" }, "]F", function()
          move.goto_next_end("@function.outer", "textobjects")
        end, "Fim da próxima função")
        map({ "n", "x", "o" }, "[F", function()
          move.goto_previous_end("@function.outer", "textobjects")
        end, "Fim da função anterior")

        -- Troca argumentos de lugar sem mexer nas vírgulas.
        map("n", "<leader>a", function()
          swap.swap_next("@parameter.inner")
        end, "Trocar com o argumento seguinte")
        map("n", "<leader>A", function()
          swap.swap_previous("@parameter.inner")
        end, "Trocar com o argumento anterior")
      end

      local function try_attach(buf)
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if lang and pcall(vim.treesitter.query.get, lang, "textobjects")
            and vim.treesitter.query.get(lang, "textobjects") then
          attach(buf)
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TextobjectsKeymaps", {}),
        callback = function(args) try_attach(args.buf) end,
      })
      -- O plugin carrega no BufReadPre; o FileType do primeiro buffer pode já
      -- ter passado.
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= "" then
          try_attach(buf)
        end
      end

      -- O README sugere ; e , para repetir o último movimento. Aqui não dá:
      -- , é o mapleader.
    end,
  },
}
