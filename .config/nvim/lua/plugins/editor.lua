return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    opts = {
      window = {
        position = "left",
        width = 40,
        mappings = {
          ["l"] = "open",
          ["-"] = "navigate_up",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },
  -- {
  --   "folke/snacks.nvim",
  --   opts = {
  --     picker = {
  --       enabled = true,
  --     },
  --   },
  -- },
}
