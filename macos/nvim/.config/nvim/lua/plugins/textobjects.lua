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

      local function sel(lhs, query, desc)
        vim.keymap.set({ "x", "o" }, lhs, function()
          select.select_textobject(query, "textobjects")
        end, { desc = desc })
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
      -- ftplugins do runtime (python, entre outros) já os mapeiam por buffer,
      -- e mapeamento de buffer vence o global — o daqui nunca seria chamado.
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        move.goto_next_start("@function.outer", "textobjects")
      end, { desc = "Próxima função" })
      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Função anterior" })
      vim.keymap.set({ "n", "x", "o" }, "]F", function()
        move.goto_next_end("@function.outer", "textobjects")
      end, { desc = "Fim da próxima função" })
      vim.keymap.set({ "n", "x", "o" }, "[F", function()
        move.goto_previous_end("@function.outer", "textobjects")
      end, { desc = "Fim da função anterior" })

      -- Troca argumentos de lugar sem mexer nas vírgulas.
      vim.keymap.set("n", "<leader>a", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Trocar com o argumento seguinte" })
      vim.keymap.set("n", "<leader>A", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "Trocar com o argumento anterior" })

      -- O README sugere ; e , para repetir o último movimento. Aqui não dá:
      -- , é o mapleader.
    end,
  },
}
