local status, tokyo = pcall(require, "tokyonight")
if not status then
	print("Opsie TOKYOOOO failed")
end

vim.g.mattias_colorscheme = "tokyonight-night"

function ColorMyPencils()
	tokyo.setup({
		transparent = true,
		lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		dim_inactive = true,
		sidebars = { "qf", "vista_kind", "terminal", "packer" },
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		-- Change the "hint" color to the "orange" color, and make the "error" color bright red
		-- on_colors = function(colors)
		-- 	colors.hint = colors.orange
		-- 	colors.error = "#ff0000"
		--           colors.orange
		-- end,
	})
	vim.cmd("colorscheme " .. vim.g.mattias_colorscheme)

	local hl = function(thing, opts)
		vim.api.nvim_set_hl(0, thing, opts)
	end

	hl("FidgetTitle", {
		bg = "none",
	})

	hl("SignColumn", {
		bg = "none",
	})

	hl("ColorColumn", {
		ctermbg = 0,
		bg = "#555555",
	})

	hl("CursorLineNR", {
		bg = "None",
	})

	hl("Normal", {
		bg = "none",
	})

	hl("LineNr", {
		fg = "#5eacd3",
	})

	hl("netrwDir", {
		fg = "#5eacd3",
	})
end

ColorMyPencils()
