return {
  { "folke/which-key.nvim", enabled = false },
  { "echasnovski/mini.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = true },
  { "folke/flash.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "SmiteshP/nvim-navic", enabled = true },
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    -- opts = function(_, opts)
    --   local snacks = require("snacks")
    --   local colors = {
    --     [""] = { fg = snacks.util.color("Special") },
    --     ["Normal"] = { fg = snacks.util.color("Special") },
    --     ["Warning"] = { fg = snacks.util.color("DiagnosticError") },
    --     ["InProgress"] = { fg = snacks.util.color("DiagnosticWarn") },
    --   }
    --   -- Add Copilot status to the right section
    --   table.insert(opts.sections.lualine_x, {
    --     function()
    --       local icon = require("lazyvim.config").icons.kinds.Copilot
    --       local status = require("copilot.api").status.data
    --       return icon .. (status.message or "")
    --     end,
    --     cond = function()
    --       if not package.loaded["copilot"] then
    --         return
    --       end
    --       local ok, clients = pcall(require("lazyvim").lsp.get_clients, { name = "copilot", bufnr = 0 })
    --       if not ok then
    --         return false
    --       end
    --       return ok and #clients > 0
    --     end,
    --     color = function()
    --       if not package.loaded["copilot"] then
    --         return
    --       end
    --       local status = require("copilot.api").status.data
    --       return colors[status.status] or colors[""]
    --     end,
    --   })
    --
    --   -- Add Python virtual environment to the right section
    --   table.insert(opts.sections.lualine_x, {
    --     function()
    --       local venv = os.getenv("VIRTUAL_ENV")
    --       if venv then
    --         return "Venv: " .. vim.fn.fnamemodify(venv, ":t")
    --       else
    --         return ""
    --       end
    --     end,
    --     color = { fg = snacks.util.color("Comment") },
    --   })
    -- end,
  },
  {
    "rcarriga/nvim-notify",
    enabled = true,
  },
  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      views = {
        notify = {
          replace = true,
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        progress = {
          enabled = true,
          format = "lsp_progress",
          format_done = "lsp_progress_done",
          -- throttle = 1000 / 30,
          view = "notify",
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    enabled = true,
    opts = {
      dashboard = {
        formats = {
          key = function(item)
            return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
          end,
        },
        sections = {
          -- TODO: unblock later after install cowsay
          -- { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
          {
            pane = 1,
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        },
      },
    },
  },
}
