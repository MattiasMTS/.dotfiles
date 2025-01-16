local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
		{ family = "JetBrainsMono Nerd Font", scale = 0.75 },
	}),
	font_size = 15,
	line_height = 1.1,
	-- Disable ligatures
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	color_scheme = "Afterglow",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	hide_tab_bar_if_only_one_tab = true,
	audible_bell = "Disabled",
	max_fps = 120,
}
