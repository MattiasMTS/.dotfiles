return {
  {
    "olexsmir/gopher.nvim",
    branch = "develop",
    enabled = true,
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
    event = { "CmdlineEnter" },
    enabled = false,
    opts = {
      lsp_inlay_hints = { enable = true },
      lsp_cfg = false,
      dap_debug = false,
      luasnip = true,
    },
  },
}
