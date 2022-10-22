local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.load_extension("fzf")
telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next
			},
		},
		file_sorter = require("telescope.sorters").get_fzy_sorter,
	 	prompt_prefix = " >",
        path_display = { "smart" },
		color_devicons = true,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
	},
  -- default themes for the telescope functions
  pickers = {
    find_files = {
      theme = 'dropdown',
    },
    git_files = {
      theme = 'dropdown',
    },
    grep_string = {
      theme = 'dropdown',
    },
    file_browser = {
      theme = 'dropdown',
    },
  },
}

local M = {}

function M.reload_modules()
	-- awesome things.
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

M.search_dotfiles = function()
	builtin.find_files({
		prompt_title = "< VimRC >",
		cwd = vim.env.DOTFILES,
		hidden = true,
	})
end
