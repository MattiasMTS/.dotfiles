return {
  { "folke/which-key.nvim", enabled = false },
  { "echasnovski/mini.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = true },
  { "SmiteshP/nvim-navic", enabled = true },
  { "folke/flash.nvim", enabled = false },
  {
    "nvimdev/dashboard-nvim",
    enabled = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    -- dependencies = {
    --   { "linrongbin16/lsp-progress.nvim" },
    -- },
    enabled = true,
    opts = function(_, opts)
      -- table.insert(opts.sections.lualine_x, 2, require("lsp-progress").progress)
      -- add metals_status if metals is loaded
      local ok, _ = pcall(require, "metals")
      if ok then
        table.insert(opts.sections.lualine_x, 2, {
          function()
            local status = vim.g["metals_status"]
            if status == nil then
              return ""
            end
            return status
          end,
          color = function()
            return require("lazyvim.util").ui.fg("DiagnosticWarn")
          end,
        })
      end
    end,
  },

  --  bufferline tabs, etc
  { "akinsho/bufferline.nvim", enabled = false },
  -- disabling noice for now since it makes the terminal very slow...
  {
    "folke/noice.nvim",
    enabled = false,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      cmdline = {
        view = "cmdline_popup", -- "cmdline_popup", "cmdline"
      },
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      },
      views = {
        mini = {
          -- make the notifications transparent
          win_options = {
            winblend = 0,
          },
          -- have it in the top right instead of bottom right
          position = {
            row = 1,
            col = "100%",
          },
          border = {
            style = "rounded",
          },
        },
      },
    },
  },
  {
    "folke/twilight.nvim",
    enabled = false,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    keys = {
      { "tw", "<cmd>Twilight<CR>", desc = "Toggle Twilight", silent = true, mode = "n" },
    },
  },
  {
    "anuvyklack/windows.nvim",
    enabled = false,
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = false },
    },
    keys = { { "<leader>mw", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require("windows").setup({
        animation = { enable = false, duration = 150 },
      })
    end,
  },
}
