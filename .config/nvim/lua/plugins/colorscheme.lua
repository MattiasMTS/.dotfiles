return {
  -- tokyonight
  {
    "tokyonight.nvim",
    lazy = true,
    name = "tokyonight",
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      sidebars = {
        "qf",
        "vista_kind",
        "terminal",
        "spectre_panel",
        "startuptime",
        "Outline",
      },
      on_highlights = function(hl, c)
        -- local prompt = "#3d3149"
        -- hl.CursorLine = { fg = c.white }
        -- hl.CursorLineNr = { fg = c.white, bold = true }
        -- hl.LineNr = { fg = c.white, bold = true }
        -- borderless telescope
        -- hl.TelescopeNormal = {
        --   bg = c.bg_dark,
        --   fg = c.fg_dark,
        -- }
        -- hl.TelescopeBorder = {
        --   bg = c.bg_dark,
        --   fg = c.bg_dark,
        -- }
        -- hl.TelescopePromptNormal = {
        --   bg = prompt,
        -- }
        -- hl.TelescopePromptBorder = {
        --   bg = prompt,
        --   fg = prompt,
        -- }
        -- hl.TelescopePromptTitle = {
        --   bg = prompt,
        --   fg = prompt,
        -- }
        -- hl.TelescopePreviewTitle = {
        --   bg = c.bg_dark,
        --   fg = c.bg_dark,
        -- }
        -- hl.TelescopeResultsTitle = {
        --   bg = c.bg_dark,
        --   fg = c.bg_dark,
        -- }
      end,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- disables setting the background color.
      integrations = {
        cmp = true,
        gitsigns = true,
        illuminate = true,
        lsp_trouble = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        mason = true,
      },
      -- color_overrides = {
      --   mocha = {
      --     -- red = "#E06C75",
      --     -- rosewater = "#61AFEF",
      --     -- pink = "#E06C75",
      --     -- mauve = "#61AFEF",
      --     -- peach = "#61AFEF",
      --     -- lavender = "#C678DD",
      --   },
      -- },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      dark_variant = "moon",
      disable_background = true,
      disable_italics = true,
      highlight_groups = {
        -- Blend colours against the "base" background
        ColorColumn = { bg = "foam", blend = 20 },
        CursorLine = { bg = "foam", blend = 10 },
        StatusLine = { bg = "foam", blend = 10 },
      },
      groups = {
        panel = "#26292b",
        -- panel_nc = "#6c6c6c",
        -- border = "highlight_med",
        -- comment = "muted",
        -- link = "iris",
        -- punctuation = "subtle",

        -- error = "love",
        -- hint = "iris",
        -- info = "foam",
        -- warn = "gold",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
    end,
  },
  { "shaunsingh/oxocarbon.nvim", lazy = true },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = true,
        lualine = {
          transparent = true, -- lualine center bar transparency
        },
        diagnostics = {
          darker = false, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
        colors = {
          -- red = "#d36360",
          -- purple = "#68bae0",
        },
        highlights = {
          ["LineNrAbove"] = { fg = "grey", bold = true },
          ["LineNr"] = { fg = "white", bold = true },
          ["LineNrBelow"] = { fg = "grey", bold = true },
          -- ["@keyword"] = { fg = "$green" },
          -- ["@string"] = { fg = "$bright_orange", bg = "#00ff00", fmt = "bold" },
          -- ["@function"] = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },
          -- ["@function.builtin"] = { fg = "#F38BA8" },
          -- ["@function.builtin"] = { fg = "#F38BA8" },
        },
      })

      -- function ColorMyPencils(color)
      --   color = color or "onedark"
      --   vim.cmd.colorscheme(color)
      --
      --   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      --   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      --   -- vim.api.nvim_set_hl(0, "FidgetTitle", { bg = "none" })
      --   -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      --   -- vim.api.nvim_set_hl(0, "CursorLineNR", { bg = "none" })
      --   -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
      --   -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#5eacd3" })
      --   vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "none", bg = "none" })
      -- end

      -- ColorMyPencils()
    end,
  },

  {
    "sainnhe/edge",
    lazy = true,
    config = function() end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    opts = {
      transparent = true,
      italic_comments = false,
    },
  },
  {
    "ray-x/starry.nvim",
    lazy = true,
    opts = function()
      -- local starry = require("starry")
      -- local colors = require("starry.colors")
      vim.g.starry_disable_background = true
      vim.g.starry_italic = false
      vim.g.starry_contrast = false
      vim.g.starry_bold = false
    end,
  },
  {
    "rktjmp/lush.nvim",
    cmd = { "Lushify", "LushRunTutorial", "LushImport" },
    lazy = true,
    opts = {},
  },
  {
    dir = "~/src/github.com/projects/mts_lush/lua/lush_theme/mts_lush.lua",
    name = "mts_lush",
    lazy = true,
    opts = {},
  },
  {
    "akinsho/horizon.nvim",
    version = "*",
    lazy = true,
    opts = {
      plugins = {
        cmp = true,
        telescope = true,
        notify = true,
        gitsigns = true,
        flash = true,
      },
    },
  },
}
