return {
  -- language server configurations
  {
    "neovim/nvim-lspconfig",
    -- experimental
    init = function()
      -- disable lsp watcher. Too slow on macos
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    opts = {
      -- on nvim 0.10 trying experimental for golang
      inlay_hints = { enabled = false },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        terraformls = {
          filetypes = { "terraform", "tf", "hcl" },
        },
      },
    },
  },

  -- handle installation of linters, formatters etc
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "markdownlint",
        "shellcheck",
        "shfmt",
        "stylua",
        "tflint",
        "tfsec",
        "pyright",
        "gopls",
      })
    end,
  },
}
