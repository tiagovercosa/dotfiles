-- Compiler diagnostics for Fortran. fortls only does navigation, hover and
-- completion; it doesn't report errors like undeclared variables or syntax
-- errors. This runs `gfortran -fsyntax-only` on the saved file and shows the
-- result as diagnostics.
local ns = vim.api.nvim_create_namespace("gfortran")

-- .mod files go to a temp dir, so checking never writes into the project
local mod_dir = vim.fn.stdpath("cache") .. "/gfortran"
vim.fn.mkdir(mod_dir, "p")

local severities = {
  ["Error"] = vim.diagnostic.severity.ERROR,
  ["Fatal Error"] = vim.diagnostic.severity.ERROR,
  ["Warning"] = vim.diagnostic.severity.WARN,
}

local function check(bufnr)
  local file = vim.api.nvim_buf_get_name(bufnr)
  if file == "" or vim.fn.executable("gfortran") == 0 then return end

  local dir = vim.fs.dirname(file)
  vim.system({
    "gfortran", "-fsyntax-only", "-fdiagnostics-plain-output", "-Wall",
    "-J", mod_dir, "-I", dir, file,
  }, { cwd = dir, text = true }, function(out)
    local diagnostics = {}
    -- e.g. "t.f90:5:12: Error: Symbol 'y' at (1) has no IMPLICIT type"
    for line in (out.stderr or ""):gmatch("[^\n]+") do
      local lnum, col, kind, msg = line:match(":(%d+):(%d+): ([%a ]-): (.+)$")
      if lnum and severities[kind] then
        table.insert(diagnostics, {
          lnum = tonumber(lnum) - 1,
          col = tonumber(col) - 1,
          severity = severities[kind],
          message = msg,
          source = "gfortran",
        })
      end
    end
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(bufnr) then
        vim.diagnostic.set(ns, bufnr, diagnostics)
      end
    end)
  end)
end

-- FileType (not BufReadPost, which fires before filetype detection) for the
-- first check, then again on every save.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("GfortranDiagnostics", { clear = true }),
  pattern = "fortran",
  callback = function(args)
    check(args.buf)
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("GfortranDiagnostics." .. args.buf, { clear = true }),
      buffer = args.buf,
      callback = function() check(args.buf) end,
    })
  end,
})
