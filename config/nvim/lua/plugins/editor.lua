return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    opts = {
      window = {
        position = "left",
        width = 60,
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
  {
    "stevearc/oil.nvim",
    enabled = false,
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "<leader>e", "<cmd>Oil<CR>", { silent = true, noremap = true } },
    },
  },
}
