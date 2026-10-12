local documents = vim.fs.normalize("~/Library/Mobile Documents/iCloud~md~obsidian/Documents")

local M = {
  list = {
    { name = "Pessoal", path = documents .. "/Pessoal" },
  },
}

---@param path string
---@return boolean
function M.contains(path)
  if path == "" then
    return false
  end
  path = vim.fs.normalize(path)
  for _, vault in ipairs(M.list) do
    if vim.startswith(path, vault.path .. "/") then
      return true
    end
  end
  return false
end

return M
