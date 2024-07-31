return {
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    enabled = false,
    lazy = false,
    opts = {
      variant = "moon",
      dim_inactive_windows = false,
      styles = {
        transparency = true,
      },
      enable = {
        terminal = true,
      },
      highlight_groups = {
        Search = { bg = "muted", inherit = false },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    enabled = true,
    opts = {
      transparent = true,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    enabled = false,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- disables setting the background color.
    },
  },
  {
    "HoNamDuong/hybrid.nvim",
    name = "hybrid",
    priority = 1000,
    lazy = false,
    enabled = false,
    opts = {
      transparent = true,
      overrides = function(hl, c)
        hl.GitSignsCurrentLineBlame = { fg = c.comment }
        hl.ColorColumn = { bg = c.bg_soft }
        hl.LineNr = { fg = c.bg_soft }
      end,
    },
  },
}
