local status, indent = pcall(require, "indent_blankline")
if not status then
	print("Opsie indent_blankline not present")
end

indent.setup({
	char = "┊",
	show_trailing_blankline_indent = false,
})
