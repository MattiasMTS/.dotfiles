local status, lualine = pcall(require, "lualine")
if not status then
	return
end
lualine.setup({
	options = {
		icons_enabled = false,
		theme = "auto",
		section_separators = "",
		component_separators = "|",
		disabled_filetypes = {
			statusline = {},
		},
		ignore_focus = {},
		always_divide_middle = false,
		globalstatus = false, -- default false
		-- unit are in ms
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		-- left
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = { { "filename", path = 3 } }, -- 0=no path, 1 = relative, 2 = absolute

		-- right
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
			function()
				return vim.fn["db_ui#statusline"]({
					show = { "db_name", "schema", "table" },
					separator = " > ",
					prefix = " ",
				})
			end,
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		-- left
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } }, -- 0=no path, 1 = relative, 2 = absolute

		-- right
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "nvim-tree", "toggleterm", "quickfix", "fzf" },
})
