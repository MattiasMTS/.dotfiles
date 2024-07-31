return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    format = {
      lsp_fallback = true,
      timeout_ms = 750, -- half a sec, 3 second default is too long.
    },
    formatters_by_ft = {
      python = { "isort", "black" },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      ["terraform-vars"] = { "terraform_fmt" },
      hcl = { "terragrunt_hclfmt" },
      go = { "gofumpt", "goimports" }, -- "golines"
      sql = { "sqlfmt" },
    },
    formatters = {
      black = {
        exe = "black",
        args = { "--quiet", "-", "--fast", "--line-length", "80" },
        stdin = true,
      },
      isort = {
        exe = "isort",
        args = { "-", "--quiet", "--profile", "black" },
        stdin = true,
      },
      sqlfmt = {
        exe = "sqlfmt",
        stdin = true,
        args = { "-", "--fast", "--line-length", "85", "--quiet", "--no-progressbar" },
      },
      -- golines = {
      --   exe = "golines",
      --   args = { "-m", "99" },
      --   stdin = true,
      -- },
    },
  },
}
