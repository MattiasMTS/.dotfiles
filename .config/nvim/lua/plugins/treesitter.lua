return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.matchup = vim.list_extend(opts.matchup or {}, {
        enable = true,
      })

      opts.query_linter = vim.list_extend(opts.query_linter or {}, {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      })

      opts.highlight = {
        enable = true,
      }
      -- add dbt for jinja2
      local parsers_configs = require("nvim-treesitter.parsers").get_parser_configs()
      parsers_configs.dbt = {
        install_info = {
          url = "https://github.com/dbt-labs/tree-sitter-jinja2",
          files = { "src/parser.c" },
          branch = "main",
        },
      }
    end,
  },
}
