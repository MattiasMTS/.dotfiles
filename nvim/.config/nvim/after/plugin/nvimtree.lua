local status, tree = pcall(require, "nvim-tree")
if not status then
	print("nvim-tree failed to load")
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
	sort_by = "case_senitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "-", action = "dir_up" },
			},
		},
	},
	actions = {
		open_file = { quit_on_open = true },
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	filters = {
		custom = { "^.git$" },
	},
	git = {
		enable = false,
	},
	log = {
		enable = true,
		types = {
			diagnostics = true,
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
	},
	renderer = {
		group_empty = true,
	},
})
