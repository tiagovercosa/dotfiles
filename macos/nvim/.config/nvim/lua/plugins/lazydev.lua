-- Tipos dos plugins para o lua_ls ao editar esta config: sem isto,
-- require("conform").format era "unknown" e as anotações ---@type/---@module
-- dos specs davam erro. Carrega a biblioteca de cada plugin só quando um
-- require dele aparece no arquivo, em vez de indexar todos.
return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
}
