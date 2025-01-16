return {
  -- disable <C-k> lsp function signature -> prefer to use it for cmp navigation
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(Keys, {
        {
          "<c-k>",
          false,
          mode = "i",
          desc = "Signature Help",
          has = "signatureHelp",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
      inlay_hints = { enabled = false },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      },
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
        terraformls = {},
        helm_ls = {},
        gopls = {
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          settings = {
            env = {
              GOEXPERIMENT = "rangefunc",
            },
            formatting = {
              gofumpt = true,
            },
          },
        },
        kotlin_language_server = {
          root_dir = require("lspconfig").util.root_pattern("settings.gradle.kts", "build.gradle.kts", ".git"),
          single_file_support = true,
          init_options = {
            storagePath = "/tmp/kotlin-language-server",
          },
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
