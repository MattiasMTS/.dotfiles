return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    opts = {
      window = {
        width = 50,
        mappings = {
          ["l"] = "open",
          ["h"] = "navigate_up",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          -- hide_dotfiles = false,
          -- hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
          -- leave_dirs_open = false,
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
