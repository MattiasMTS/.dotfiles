return {
  {
    "jsborjesson/vim-uppercase-sql",
    ft = { "sql", "psql", "mysql" },
  },
  {
    "kndndrj/nvim-dbee",
    dev = true,
    build = function()
      require("dbee").install("go")
    end,
    config = function(_, opts)
      -- local connection_path = vim.fn.expand("$HOME") .. "/.local/share/dbee/connections.json"
      local dbee = require("dbee")
      local layouts = require("dbee.layouts").Default:new({
        drawer_width = 50,
        result_height = 40,
        call_log_height = 30,
      })

      dbee.setup({
        -- connections
        sources = {
          -- require("dbee.sources").FileSource:new(connection_path),
          require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
        },
        -- editor
        editor = {
          mappings = {
            { key = "<leader>S", mode = "v", action = "run_selection" },
            { key = "<leader>S", mode = "n", action = "run_file" },
          },
        },
      })
    end,
    keys = {
      {
        "<leader>bt",
        ":lua require('dbee').toggle()<CR>",
        desc = "toggle dbee explorer",
        mode = "n",
        silent = true,
      },
    },
  },
}
