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
      -- local layouts = require("dbee.layouts").Default:new({
      --   drawer_width = 50,
      --   result_height = 40,
      --   call_log_height = 30,
      -- })

      require("dbee").setup({
        -- connections
        sources = {
          require("dbee.sources").FileSource:new(vim.fn.expand("$HOME") .. "/.local/share/db_ui/connections.json"),
          -- require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
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
        desc = "toggle db_ui",
        mode = "n",
        silent = true,
      },
      {
        "<leader>bb",
        ":! source ~/env_dadbod.sh <CR> :lua require('dbee').toggle()<CR>",
        desc = "set credentials and toggle db_ui",
        mode = "n",
        silent = true,
      },
      {
        "<leader>br",
        function()
          -- take input on which user to use, default ""
          local user = vim.fn.input("DB User: ")
          -- source the shell script to update the connections.json
          vim.cmd("! source ~/env_dadbod.sh " .. user)
          -- refresh the credentials
          require("dbee").reload_sources()
        end,
        desc = "refresh credentials (optional provide user)",
        mode = "n",
        silent = false,
      },
    },
  },
}
