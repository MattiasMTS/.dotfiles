local status_ok1, neogen = pcall(require, "neogen")
if not status_ok1 then
	return
end

neogen.setup({
	snippet_engine = "luasnip",
	enabled = true, --if you want to disable Neogen
	input_after_comment = false, -- (default: true) automatic jump (with insert mode) on inserted annotation
	languages = {
		python = {
			template = {
				annotation_convention = "numpydoc",
			},
		},
		go = {
			template = {
				annotation_convention = "godoc",
			},
		},
		lua = {
			template = {
				annotation_convention = "emmylua",
			},
		},
	},
})
