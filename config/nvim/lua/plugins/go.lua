local go_files = { "go", "go.mod", "go.sum" }
return {
  {
    "olexsmir/gopher.nvim",
    branch = "develop",
    enabled = true,
    ft = go_files,
    build = function()
      vim.cmd([[silent! GoInstallDeps]])
    end,
    keys = {
      { "<leader>gsj", "<cmd>GoTagAdd json<CR>", "add json struct", { silent = true } },
      { "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", "add yaml struct", { silent = true } },
      { "<leader>gta", "<cmd>GoTestsAll<CR>", "Generate tdt tests", { silent = true } },
      { "<leader>gie", "<cmd>GoIfErr<CR>", "Generate if err boilerplate", { silent = true } },
    },
    opts = {},
  },
  {
    "ray-x/go.nvim",
    enabled = true,
    ft = go_files,
    opts = {
      lsp_inlay_hints = {
        enable = false,
      },
    },
    config = function(_, opts)
      require("go").setup(opts)
    end,
    build = function()
      require("go.install").update_all_sync()
    end,
  },
}
