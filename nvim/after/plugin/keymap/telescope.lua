local Remap = require("mattias.keymap")
local nnoremap = Remap.nnoremap
local telescope = require('telescope')
telescope.load_extension("file_browser")

-- function for cwd of file structure
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

nnoremap("<leader>gf", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string{ search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)
-- sweet file browser window
nnoremap("<leader>fb", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    -- initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

