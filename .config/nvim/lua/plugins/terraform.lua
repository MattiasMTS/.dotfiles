return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "terraform",
          "hcl",
        })
      end
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        terraform = { "terraform_validate", "tfsec", "tflint" },
        tf = { "terraform_validate", "tfsec", "tflint" },
        hcl = { "terraform_validate", "tfsec", "tflint" },
        ["terraform-vars"] = { "terraform_validate", "tfsec", "tflint" },
      },
    },
  },
}
