return {
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    enabled = false,
    lazy = false,
    opts = {
      -- variant = "moon",
      dim_inactive_windows = false,
      styles = {
        transparency = true,
      },
      enable = {
        terminal = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    enabled = false,
    opts = {
      transparent = true,
    },
  },
  {
    "HoNamDuong/hybrid.nvim",
    name = "hybrid",
    priority = 1000,
    lazy = false,
    enabled = true,
    opts = {
      transparent = true,
      overrides = function(hl, c)
        -- gitglame
        hl.GitSignsCurrentLineBlame = { fg = c.comment }

        hl.ColorColumn = { bg = c.bg_soft }
        hl.LineNr = { fg = c.comment }

        -- For neo-tree
        -- hl.NeoTreeNormal = { bg = c.line }
        -- hl.NeoTreeNormalNC = { bg = c.line }
        -- hl.NeoTreeEndOfBuffer = { bg = c.line }

        -- For nvim-notify
        hl.NotifyBackground = { bg = c.line }

        -- treesitter context
        -- hl.["@keyword.return"] = { fg = cp.pink, style = {} }
        -- hl.["@error.c"] = { fg = cp.none, style = {} }
        -- hl.["@error.cpp"] = { fg = cp.none, style = {} }
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    enabled = false,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
      term_colors = true,
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = {},
        functions = {},
        keywords = {},
        operators = {},
        conditionals = {},
        loops = {},
        booleans = {},
        numbers = {},
        types = {},
        strings = {},
        variables = {},
        properties = {},
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          -- virtual_text = {
          --   errors = { "italic" },
          --   hints = { "italic" },
          --   warnings = { "italic" },
          --   information = { "italic" },
          -- },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        cmp = true,
        dashboard = true,
        dropbar = { enabled = false, color_mode = true },
        fern = false,
        fidget = false,
        flash = false,
        gitgutter = false,
        gitsigns = true,
        harpoon = false,
        headlines = false,
        hop = false,
        illuminate = true,
        indent_blankline = { enabled = false, colored_indent_levels = false },
        leap = false,
        lightspeed = false,
        lsp_saga = false,
        lsp_trouble = false,
        markdown = true,
        mason = true,
        mini = false,
        navic = { enabled = true },
        neogit = false,
        neotest = false,
        neotree = { enabled = true, show_root = true, transparent_panel = false },
        noice = true,
        notify = true,
        nvimtree = false,
        overseer = false,
        pounce = false,
        rainbow_delimiters = true,
        render_markdown = true,
        sandwich = false,
        semantic_tokens = true,
        telescope = { enabled = true },
        treesitter_context = true,
      },
      highlight_overrides = {
        all = function(cp)
          return {
            -- For base configs
            NormalFloat = { fg = cp.text, bg = cp.mantle },
            FloatBorder = {
              fg = cp.mantle,
              bg = cp.mantle,
            },

            -- testing out undercurl
            DiagnosticVirtualTextError = { bg = cp.none },
            DiagnosticVirtualTextWarn = { bg = cp.none },
            DiagnosticVirtualTextInfo = { bg = cp.none },
            DiagnosticVirtualTextHint = { bg = cp.none },

            -- For native lsp configs
            LspInfoBorder = { link = "FloatBorder" },

            -- For mason.nvim
            MasonNormal = { link = "NormalFloat" },

            -- For nvim-cmp
            Pmenu = { fg = cp.overlay2, bg = cp.base },
            PmenuBorder = { fg = cp.surface1, bg = cp.base },
            PmenuSel = { bg = cp.green, fg = cp.base },
            CmpItemAbbr = { fg = cp.overlay2 },
            CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
            CmpDoc = { link = "NormalFloat" },
            CmpDocBorder = {
              fg = cp.mantle,
              bg = cp.mantle,
            },

            -- For nvim-notify
            NotifyBackground = { bg = cp.base },

            -- For neo-tree
            NeoTreeNormal = { bg = cp.mantle }, -- Set a darker background for Neo-tree
            NeoTreeNormalNC = { bg = cp.mantle }, -- Set a darker background for non-current Neo-tree window
            NeoTreeEndOfBuffer = { bg = cp.mantle }, -- Set a darker background for end of buffer in Neo-tree

            -- For trouble.nvim
            TroubleNormal = { bg = cp.base },
            TroubleNormalNC = { bg = cp.base },

            -- For telescope.nvim
            TelescopeMatching = { fg = cp.lavender },
            TelescopeResultsDiffAdd = { fg = cp.green },
            TelescopeResultsDiffChange = { fg = cp.yellow },
            TelescopeResultsDiffDelete = { fg = cp.red },

            -- For treesitter
            ["@keyword.return"] = { fg = cp.pink, style = {} },
            ["@error.c"] = { fg = cp.none, style = {} },
            ["@error.cpp"] = { fg = cp.none, style = {} },
          }
        end,
      },
    },
  },
  {
    "rmehri01/onenord.nvim",
    priority = 1000,
    lazy = false,
    enabled = false,
    opts = {
      disable = {
        background = true, -- Disable setting the background color
        cursorline = true,
        eob_lines = false,
      },
      theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
      borders = true, -- Split window borders
      fade_nc = false, -- Fade non-current windows, making them more distinguishable
      -- Style that is applied to various groups: see `highlight-args` for options
      styles = {
        comments = "NONE",
        strings = "NONE",
        keywords = "NONE",
        functions = "NONE",
        variables = "NONE",
        diagnostics = "underline",
      },
      -- Inverse highlight for different groups
      inverse = {
        match_paren = false,
      },
      custom_highlights = {
        NeoTreeNormal = { bg = "#1c1c1c" }, -- Set a darker background for Neo-tree
        NeoTreeNormalNC = { bg = "#1c1c1c" }, -- Set a darker background for non-current Neo-tree window
        NeoTreeEndOfBuffer = { bg = "#1c1c1c" }, -- Set a darker background for end of buffer in Neo-tree
      },
      custom_colors = {}, -- Overwrite default colors
    },
  },
}
