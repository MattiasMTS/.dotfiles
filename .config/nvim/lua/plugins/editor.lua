return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
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
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = false,
          leave_dirs_open = false,
        },
      },
    },
  },
  {
    "stevearc/oil.nvim",
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
