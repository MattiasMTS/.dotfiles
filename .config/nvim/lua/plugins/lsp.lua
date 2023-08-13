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
      -- Automatically format on save
      autoformat = true,
      -- on nvim 0.10 trying experimental for golang
      inlay_hints = { enabled = false },
      servers = {
        lua_ls = {
          -- enabled = false,
          -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                globals = { "vim" },
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
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

  -- additional things not handled by the language servers
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        -- nls.builtins.formatting.dprint.with({
        --   condition = function(utils)
        --     return utils.root_has_file({ "dprint.json" }) or vim.loop.fs_stat("dprint.json")
        --   end,
        -- }),
        -- actions
        nls.builtins.code_actions.shellcheck,
        nls.builtins.code_actions.impl,

        -- spell
        nls.builtins.completion.spell,

        -- formatting
        nls.builtins.formatting.prettier.with({ filetypes = { "markdown" } }),
        nls.builtins.formatting.protolint,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.isort.with({
          extra_args = {
            "--profile=black",
            "--trailing-comma",
            "--use-parentheses",
            "--ensure-newline-before-comments",
          },
        }),
        nls.builtins.formatting.black.with({
          extra_args = {
            "--fast",
          },
        }),

        -- linting
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.diagnostics.tfsec,
        nls.builtins.diagnostics.actionlint,
        -- nls.builtins.diagnostics.sqlfluff.with({ timeout = 60000 }),
        nls.builtins.diagnostics.luacheck.with({
          condition = function(utils)
            return utils.root_has_file({ ".luacheckrc" })
          end,
        }),
      })
    end,
  },
}
