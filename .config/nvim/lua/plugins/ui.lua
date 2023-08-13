return {
  { "folke/which-key.nvim", enabled = false },
  { "echasnovski/mini.nvim", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  { "folke/neodev.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  { "rcarriga/nvim-notify", enabled = false },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        tabsize = 1,
        numbers = "ordinal",
        mode = "buffers", -- tabs | buffers
        indicator = {
          icon = "", --"▎",
          style = "icon",
        },
        show_buffer_icons = false,
        separator_style = "thin",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline_popup", -- "cmdline_popup", "cmdline"
      },
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
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
    keys = {
      { "nc", "<cmd>NoiceHistory<CR>", mode = "n", desc = "Open NoiceHistory", silent = true },
    },
  },
  -- Lua
  {
    "folke/twilight.nvim",
    opts = {},
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    keys = {
      { "tw", "<cmd>Twilight<CR>", desc = "Toggle Twilight", silent = true, mode = "n" },
    },
  },
}
