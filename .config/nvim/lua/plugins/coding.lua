return {
  -- disable automatic insertion of pairs like parenthesis etc
  -- using nvim-autopairs instead
  { "echasnovski/mini.pairs", enabled = false },
  -- no need to extend a/i
  { "echasnovski/mini.ai", enabled = false },
  {
    "github/copilot.vim",
    enabled = true,
    cmd = "Copilot",
    build = "Copilot auth",
    event = { "InsertEnter", "LspAttach" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "onsails/lspkind-nvim" },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      {
        "cmp-nvim-convcommits",
        dev = true,
        enabled = false,
      },
      {
        "cmp-dbee",
        enabled = true,
        ft = "sql",
        dev = true,
        opts = {},
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      table.insert(opts.completion, {
        completeopt = "menu,menuone,noinsert",
      })

      local sources = {
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "emoji" },
        { name = "cmp-dbee" },
      }
      for _, source in ipairs(sources) do
        table.insert(opts.sources, source)
      end

      opts.formatting = vim.tbl_deep_extend("force", opts.formatting, {
        format = function(entry, vim_item)
          vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            emoji = "[Emoji]",
            cmp_dbee = "[DB]",
            path = "[Path]",
            buffer = "[Buffer]",
          })[entry.source.name]
          return vim_item
        end,
      })

      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          select = true,
          behavior = cmp.ConfirmBehavior.Insert,
        }),
      })

      -- TODO: add cmdline completion for neovim
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>rr",
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
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}
