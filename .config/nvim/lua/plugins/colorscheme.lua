return {
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    enabled = true,
    lazy = true,
    opts = {
      dark_variant = "moon",
      dim_inactive_windows = false,
      -- extend_background_behind_borders = true,
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
      enable = {
        terminal = true,
        -- Improve compatibility for previous versions of Neovim
        legacy_highlights = false,
        -- Handle deprecated options automatically
        migrations = true,
      },
    },
  },
}
