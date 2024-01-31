-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("better_backup", { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})

-- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- turn off paste mode when leaving insert mode.
-- nice to have for e.g. json files
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  command = "set nopaste",
})

-- disable trailing new line comment
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "hcl", "terraform" },
  desc = "terraform/hcl commentstring configuration",
  command = "setlocal commentstring=#\\ %s",
})

-- remember last venv selected per repo/workspace
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   pattern = "*.py",
--   callback = function()
--     local is_gitrepo = vim.fn.finddir(".git", ".;")
--     local is_pyproject = (vim.fn.findfile(vim.fn.fnamemodify(is_gitrepo, ":h") .. "/pyproject.toml") ~= nil)
--     if is_pyproject then
--       local env = io.popen("poetry env list --full-path | awk '/Activated/ {print $1}'"):read()
--       vim.g.python3_host_prog = env
--     end
--   end,
--   group = python,
-- })
