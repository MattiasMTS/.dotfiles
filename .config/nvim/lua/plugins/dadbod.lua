return {
  {
    "MattiasMTS/vim-dadbod-ui",
    cmd = "DBUI",
    dependencies = {
      {
        "tpope/vim-dadbod",
        cmd = "DB",
      },
    },
    config = function(_, opts)
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_force_echo_notifications = 1
      -- drawer width when opened (default 40)
      vim.g.db_ui_winwidth = 60

      -- use <leader>S instead of execute on s
      vim.g.db_ui_execute_on_save = 0

      -- marker view for cmp
      vim.g.vim_dadbod_completion_mark = "[DB]"

      -- height of the result data view
      vim.opt.previewheight = 32
      -- local cmp = require("cmp")
      -- require("plugins.coding").cmp.opt.sources =
      --   cmp.config.sources(vim.list_extend(opts.sources, { { name = "vim_dadbod_completion" } }))
      -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "vim_dadbod_completion" } }))
    end,

    keys = {
      { "DT", "<cmd>DBUIToggle <CR>", desc = "Open dadbod explorer", mode = "n" },
    },
  },
}
