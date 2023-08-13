local status, toggleterm = pcall(require, "toggleterm")
if not status then
	print("toggleterm failed")
end

toggleterm.setup({
	hidden = false,
	size = function(term)
		if term.direction == "horizontal" then
			return 28
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	hide_numbers = true, -- hide the number column in toggleterm buffers
	start_in_insert = false,
	close_on_exit = true, -- close the terminal window when the process exits
	auto_scroll = true,
	clear_env = false,
	direction = "horizontal",
})
