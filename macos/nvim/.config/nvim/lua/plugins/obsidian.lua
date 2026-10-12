local vaults = require("config.vaults")

local note_patterns = {}
for _, vault in ipairs(vaults.list) do
  table.insert(note_patterns, vault.path .. "/*.md")
end

local function note_id(title)
  local id = vim.trim((title or ""):gsub('[\\/:*?"<>|#^%[%]]', ""))
  if id == "" then
    return os.date("%Y-%m-%d %H.%M")
  end
  return id
end

return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    event = { { event = { "BufReadPre", "BufNewFile" }, pattern = note_patterns } },
    cmd = "Obsidian",
    keys = {
      { "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Abrir nota" },
      { "<leader>on", "<cmd>Obsidian new<cr>", desc = "Nova nota" },
      { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Buscar no vault" },
      { "<leader>ot", "<cmd>Obsidian today<cr>", desc = "Nota de hoje" },
      { "<leader>od", "<cmd>Obsidian dailies<cr>", desc = "Notas diárias" },
      { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
      { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Links da nota" },
      { "<leader>og", "<cmd>Obsidian tags<cr>", desc = "Tags" },
      { "<leader>oT", "<cmd>Obsidian template<cr>", desc = "Inserir template" },
      { "<leader>ow", "<cmd>Obsidian workspace<cr>", desc = "Trocar de vault" },
    },
    ---@module "obsidian"
    ---@type obsidian.config
    opts = {
      legacy_commands = false,

      workspaces = {
        {
          name = vaults.list[1].name,
          path = vaults.list[1].path,
          overrides = {
            notes_subdir = "Notes",
            new_notes_location = "notes_subdir",
            templates = { folder = "_templates" },
            note = { template = "Note Template.md" },
            daily_notes = { folder = "Daily", template = "Daily Template.md" },
            attachments = { folder = "_attachments" },
          },
        },
      },

      note_id_func = note_id,

      -- Ligado, o plugin reescreve o frontmatter a cada :w (acrescenta id,
      -- aliases e tags e reordena as chaves), inclusive nas notas criadas
      -- pelo app, Templater e Readwise. O frontmatter vem do template.
      frontmatter = { enabled = false },

      picker = { name = "telescope.nvim" },

      -- A renderização fica com o render-markdown. Ligado, o ui do plugin
      -- desenharia por cima e exigiria conceallevel 1 ou 2.
      ui = { enable = false },

      checkbox = { order = { " ", "x", "-", ">" }, create_new = false },
    },
  },
}
