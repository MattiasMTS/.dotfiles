return {
  {
    "christoomey/vim-tmux-navigator",
    enabled = true,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", mode = "n" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", mode = "n" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", mode = "n" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", mode = "n" },
    },
  },
}
