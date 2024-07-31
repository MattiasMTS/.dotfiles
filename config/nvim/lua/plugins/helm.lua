return {
  {
    "mrjosh/helm-ls",
    enabled = true,
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
}
