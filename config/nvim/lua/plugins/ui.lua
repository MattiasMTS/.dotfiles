local show_venv = function()
  -- only show virtual env for Python
  if vim.bo.filetype ~= "python" then
    return ""
  end
  local venv_path = os.getenv("VIRTUAL_ENV")

  if venv_path == nil then
    return "<no venv>"
  else
    local venv_name = vim.fn.fnamemodify(venv_path, ":t")
    return string.format("  %s", venv_name)
  end
end

return {
  { "folke/which-key.nvim", enabled = false },
  { "echasnovski/mini.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = true },
  { "folke/flash.nvim", enabled = false },
  {
    "nvimdev/dashboard-nvim",
    enabled = true,
  },
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = require("lazyvim.config").icons.kinds,
        lazy_update_context = true,
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    opts = function(_, opts)
      -- add virtual env to the status line
      table.insert(opts.sections.lualine_x, 1, {
        show_venv,
        color = function()
          return require("lazyvim.util").ui.fg("Comment")
        end,
      })

      -- add metals status to the status line
      local ok, _ = pcall(require, "metals")
      if ok then
        table.insert(opts.sections.lualine_x, 2, {
          function()
            local status = vim.g["metals_status"]
            if status == nil then
              return ""
            end
            return status
          end,
          color = function()
            return require("lazyvim.util").ui.fg("DiagnosticWarn")
          end,
        })
      end

      -- add copilot status to the status line
      local lazyvim = require("lazyvim.util")
      local colors = {
        [""] = lazyvim.ui.fg("Special"),
        ["Normal"] = lazyvim.ui.fg("Special"),
        ["Warning"] = lazyvim.ui.fg("DiagnosticError"),
        ["InProgress"] = lazyvim.ui.fg("DiagnosticWarn"),
      }
      table.insert(opts.sections.lualine_x, 2, {
        function()
          local icon = require("lazyvim.config").icons.kinds.Copilot
          local status = require("copilot.api").status.data
          return icon .. (status.message or "")
        end,
        cond = function()
          if not package.loaded["copilot"] then
            return
          end
          local ok, clients = pcall(lazyvim.lsp.get_clients, { name = "copilot", bufnr = 0 })
          if not ok then
            return false
          end
          return ok and #clients > 0
        end,
        color = function()
          if not package.loaded["copilot"] then
            return
          end
          local status = require("copilot.api").status.data
          return colors[status.status] or colors[""]
        end,
      })
    end,
  },

  --  bufferline tabs, etc TODO(ms): trying this out now for fun
  { "akinsho/bufferline.nvim", enabled = true },
  {
    "rcarriga/nvim-notify",
    enabled = true,
  },
  {
    "folke/noice.nvim",
    enabled = true,
  },
}
