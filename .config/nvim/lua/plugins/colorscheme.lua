return {
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    enabled = true,
    lazy = false,
    opts = {
      dark_variant = "moon",
      dim_inactive_windows = false,
      styles = {
        -- bold = true,
        -- italic = false,
        transparency = true,
      },
      enable = {
        terminal = true,
      },
    },
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    enabled = false,
    opts = {
      transparent_background = true,
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        fidget = true,
        treesitter = true,
        treesitter_context = true,
        harpoon = true,
        navic = true,
        nvimtree = true,
        lsp_trouble = true,
        headlines = true,
      },
    },
  },
  {
    "rktjmp/lush.nvim",
    dependencies = {
      {
        "mtscolors",
        name = "mtscolors",
        enabled = false,
        dev = true,
      },
    },
    priority = 1000,
    enabled = false,
  },
}
