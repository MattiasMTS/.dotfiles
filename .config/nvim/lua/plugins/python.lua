return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    ft = "python,sql",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {},
    event = "VeryLazy",
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>" },
    },
  },
}
