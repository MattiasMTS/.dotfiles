return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    event = "VeryLazy",
    ft = "python,sql",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>" },
    },
  },
}
