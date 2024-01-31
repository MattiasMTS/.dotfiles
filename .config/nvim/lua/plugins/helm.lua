return {
  {
    "mrjosh/helm-ls",
    enabled = false,
    ft = { "*/templates/*.yaml", "*/templates/*.tpl", "*.gotmpl", "helmfile*.yaml" },
    dependencies = {
      "towolf/vim-helm",
    },
  },
  {
    "towolf/vim-helm",
    ft = { "*/templates/*.yaml", "*/templates/*.tpl", "*.gotmpl", "helmfile*.yaml" },
    enabled = true,
  },
  {
    "jvirtanen/vim-hcl",
    ft = { "*.tf", "*.tfvars", "*.hcl" },
    enabled = true,
  },
}
