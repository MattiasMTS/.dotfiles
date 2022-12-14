local status, lsp_extensions = pcall(require, 'lsp_extensions')
if not status then
    print('lsp_extensions failed')
    return
end

local augroup = vim.api.nvim_create_augroup
local M = {}
mattias_group = augroup('mattias', {})

require("mattias.set")
require("mattias.packer")

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = mattias_group,
    pattern = "*.rs",
    callback = function()
        lsp_extensions.inlay_hints{}
    end
})

autocmd({"BufWritePre"}, {
    group = mattias_group,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- to support poetry virtual environments
local checkForLockfile = function()
  local match = vim.fn.glob(vim.fn.getcwd() .. "/poetry.lock")
  if match ~= "" then
    local poetry_venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
    vim.env.VIRTUAL_ENV = poetry_venv
  end
end

M.setup = function()
  -- run on startup
  checkForLockfile()
  -- and when changing directory
  vim.api.nvim_create_autocmd({ "DirChanged" }, {
    callback = function()
      checkForLockfile()
    end,
  })
end

return M
