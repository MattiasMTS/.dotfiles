local function init_fidget()
  return {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          normal_hl = "Comment", -- Base highlight group in the notification window
          winblend = 0, -- Background color opacity in the notification window
          border = "none", -- Border around the notification window
          zindex = 45, -- Stacking priority of the notification window
          max_width = 0, -- Maximum width of the notification window
          max_height = 0, -- Maximum height of the notification window
          x_padding = 1, -- Padding from right edge of window boundary
          y_padding = 0, -- Padding from bottom edge of window boundary
          align = "bottom", -- How to align the notification window
          relative = "editor", -- What the notification window position is relative to
        },
      },

      -- Options related to logging
      logger = {
        level = vim.log.levels.WARN, -- Minimum logging level
        float_precision = 0.01, -- Limit the number of decimals displayed for floats
        -- Where Fidget writes its logs to
        path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
      },
    },
  }
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      init_fidget(),
    },
    -- experimental
    init = function()
      -- disable lsp watcher. Too slow on macos
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        -- Use a sharp border with `FloatBorder` highlights
        border = "single",
        -- add the title in hover float window
        title = "LSP Hover",
      })
    end,
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
      -- let's try this out
      inlay_hints = { enabled = false },
      servers = {
        -- dbt_lsp_test = {},
        -- pyright = {
        --   handlers = {
        --     ["textDocument/publishDiagnostics"] = function() end, -- use ruff lsp instead
        --   },
        --   disableOrganizeImports = true, -- use ruff
        -- },
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
        terraformls = { -- filetypes = { "terraform", "tf", "hcl" },
        },
        helm_ls = {},
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
