return {
  {
    "folke/twilight.nvim",
    enabled = false, -- trying out the snacks.dim instead
    cmd = "Twilight",
    opts = {
      context = -1,
      treesitter = true,
    },
    keys = {
      { "<leader>tw", ":Twilight<CR>", { noremap = true, silent = true } },
    },
  },
}
