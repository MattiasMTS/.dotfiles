local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>gf", function()
	builtin.git_files()
end)
vim.keymap.set("n", "<Leader>pf", function()
	builtin.find_files()
end)

vim.keymap.set("n", "<leader>pw", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "<leader>ps", "<cmd>Telescope grep_string <CR>")
vim.keymap.set("n", "<leader>pb", function()
	builtin.buffers()
end)
vim.keymap.set("n", "<leader>vh", function()
	builtin.help_tags()
end)
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser <CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", function()
	require("telescope").extensions.file_browser.file_browser({
		initial_mode = "normal",
		path = "%:p:h",
		hidden = true,
		grouped = true,
		hijack_netrw = true,
	})
end)
