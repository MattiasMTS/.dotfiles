return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    default_format_opts = {
      lsp_fallback = true,
      timeout_ms = 500, -- half a sec, 3 second default is too long.
    },
    formatters_by_ft = {
      python = { "isort", "black" },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      ["terraform-vars"] = { "terraform_fmt" },
      hcl = { "terragrunt_hclfmt", "packer_fmt" },
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
        args = { "-", "--fast", "--line-length", "120", "--quiet", "--no-progressbar" },
      },
      gofumpt = {
        prepend_args = { "-extra", "-w", "$FILENAME" },
        stdin = false,
      },
      golines = {
        prepend_args = { "--base-formatter=gofumpt", "--ignore-generated", "--tab-len=1", "--max-len=120" },
      },
      -- golines = {
      --   exe = "golines",
      --   args = { "-m", "99" },
      --   stdin = true,
      -- },
    },
  },
}
