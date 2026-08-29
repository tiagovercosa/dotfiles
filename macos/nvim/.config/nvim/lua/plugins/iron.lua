-- REPL interativo: manda pedaços do buffer para um interpretador que fica
-- vivo ao lado, em vez de reexecutar o arquivo inteiro a cada mudança.
return {
  {
    "Vigemus/iron.nvim",
    ft = { "python", "lua", "sh" },
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      local common = require("iron.fts.common")

      -- O ipython do PATH aqui é um "uv tool", instalado num ambiente isolado
      -- que não enxerga os pacotes do projeto: `import numpy` falha dentro
      -- dele mesmo com o numpy instalado no venv. Por isso o venv ativo vem
      -- primeiro, e o do PATH fica só como reserva.
      local function python_repl()
        local venv = vim.env.VIRTUAL_ENV or vim.env.CONDA_PREFIX
        if venv then
          local ipy = venv .. "/bin/ipython"
          if vim.uv.fs_stat(ipy) then
            return { ipy, "--no-autoindent" }
          end
          -- venv sem ipython: o python dele ainda é melhor que o isolado,
          -- porque enxerga os pacotes instalados no projeto.
          local py = venv .. "/bin/python"
          if vim.uv.fs_stat(py) then
            return { py, "-i" }
          end
        end
        return { "ipython", "--no-autoindent" }
      end

      iron.setup({
        config = {
          -- false: o REPL sobrevive a fechar a janela. Fechar a divisória não
          -- descarta os dados já carregados na sessão.
          scratch_repl = false,
          repl_definition = {
            python = {
              -- ipython, não python3: o REPL novo do 3.13+ quebra o colar
              -- entre colchetes, que é como o iron envia bloco de várias
              -- linhas. --no-autoindent evita a indentação dobrada.
              command = python_repl,
              format = common.bracketed_paste_python,
              -- Só faz falta no fallback `python -i` do 3.13+; o ipython
              -- ignora a variável.
              env = { PYTHON_BASIC_REPL = "1" },
              -- Delimitadores de célula, no mesmo formato que o Jupyter e o
              -- VS Code usam.
              block_dividers = { "# %%", "#%%" },
            },
            sh = { command = { "zsh" } },
          },
          -- Divisória embaixo, ocupando 30%: saída numérica é larga, e um
          -- split vertical cortaria as colunas de array e DataFrame.
          repl_open_cmd = view.split.botright(0.3),
        },

        -- Prefixo <leader>r ("repl"). Convive com o <leader>rn do LSP.
        -- O padrão do iron usa <space>, que aqui é o localleader do vimtex.
        keymaps = {
          toggle_repl = "<leader>rr",
          restart_repl = "<leader>rR",
          send_motion = "<leader>rc",
          visual_send = "<leader>rc",
          send_file = "<leader>rf",
          send_line = "<leader>rl",
          send_paragraph = "<leader>rp",
          send_until_cursor = "<leader>ru",
          send_code_block = "<leader>rb",
          -- rB, não rn: o <leader>rn do LSP (rename) é mapeado por buffer no
          -- LspAttach e venceria este, justo nos arquivos com servidor ativo.
          send_code_block_and_move = "<leader>rB",
          interrupt = "<leader>ri",
          exit = "<leader>rq",
          clear = "<leader>rx",
        },

        highlight = { italic = true },
        ignore_blank_lines = true,
      })
    end,
  },
}
