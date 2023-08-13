return {
  -- disable automatic insertion of pairs like parenthesis etc
  -- using nvim-autopairs instead
  { "echasnovski/mini.pairs", enabled = false },
  -- no need to extend a/i
  { "echasnovski/mini.ai", enabled = false },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "CmdlineEnter" },
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<Tab>",
            -- accept_word = false,
            -- accept_line = false,
            prev = "[[",
            next = "]]",
            dismiss = "<S-Tab>",
          },
        },
        filetypes = {
          markdown = true,
          yaml = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "onsails/lspkind-nvim" },
      { "roobert/tailwindcss-colorizer-cmp.nvim" },
      -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local border = function(hl)
        return {
          { "┌", hl },
          { "─", hl },
          { "┐", hl },
          { "│", hl },
          { "┘", hl },
          { "─", hl },
          { "└", hl },
          { "│", hl },
        }
      end
      local cmp = require("cmp")
      -- these options are not set by lazyvim, need therefore do require.setup here.
      cmp.setup({
        window = {
          completion = {
            border = border("PmenuBorder"),
            winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
            scrollbar = false,
          },
          -- documentation = {
          --   border = border("CmpDocBorder"),
          --   winhighlight = "Normal:CmpDoc",
          --   -- scrollbar = "║",
          -- },
        },
      })

      opts.formatting = {
        format = function(entry, item)
          require("lspkind").cmp_format({
            mode = "symbol_text",
            menu = {
              buffer = "[BUF]",
              nvim_lsp = "[LSP]",
              luasnip = "[SNIP]",
              path = "[PATH]",
            },
          })(entry, item)
          return require("tailwindcss-colorizer-cmp").formatter(entry, item)
        end,
      }

      opts.complete = {
        completeopt = "menuone,noinsert,noselect,preview",
      }

      -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "nvim_lsp_signature_help" } }))
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = {
      snippet_engine = "luasnip",
      input_after_comment = false,
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
    },
  },
  {
    "L3MON4D3/LuaSnip",
    -- disable tab and shift tab to navigate snippet
    keys = function()
      return {}
    end,
  },
}
