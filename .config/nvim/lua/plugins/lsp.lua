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
      inlay_hints = { enabled = true },
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
              diagnostics = { globals = { "vim" }, disable = { "different-requires" } },
              workspace = { checkThirdParty = false },
              completion = { callSnippet = "Replace" },
            },
          },
        },
        terraformls = {},
        helm_ls = {},
        gopls = {
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          settings = {
            -- env = { GOEXPERIMENT = "rangefunc" },
            formatting = { gofumpt = false }, -- managed by conform
            -- https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
            hints = {},
          },
        },
        kotlin_language_server = {
          root_dir = function(name)
            return require("lspconfig").util.root_pattern("settings.gradle.kts", "build.gradle.kts", ".git")(name)
              or vim.fn.getcwd()
          end,
          single_file_support = true,
          init_options = { storagePath = "/tmp/kotlin-language-server" },
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
