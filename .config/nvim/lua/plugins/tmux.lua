return {
  {
    "mrjones2014/smart-splits.nvim",
    dependencies = {
      "kwkarlwang/bufresize.nvim",
    },
    lazy = false, -- don't lazy load cuz tmux
    opts = {
      ignored_filetypes = { "NeoTree" },
      resize_mode = {
        hooks = {
          on_leave = function()
            require("bufresize").register()
          end,
        },
      },
    },
    keys = {
      -- cursor movement
      { "<C-l>", ":SmartCursorMoveRight<CR>", silent = true },
      { "<C-h>", ":SmartCursorMoveLeft<CR>", silent = true },
      { "<C-j>", ":SmartCursorMoveDown<CR>", silent = true },
      { "<C-k>", ":SmartCursorMoveUp<CR>", silent = true },
      -- resizing
      { "<M-h>", ":SmartResizeLeft<CR>", silent = true },
      { "<M-j>", ":SmartResizeDown<CR>", silent = true },
      { "<M-k>", ":SmartResizeUp<CR>", silent = true },
      { "<M-l>", ":SmartResizeRight<CR>", silent = true },
    },
  },
  {
    "aserowy/tmux.nvim",
    enabled = false,
    opts = {
      mappings = {
        prefix_key = "<C-a>",
      },
      resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = true,

        -- sets resize steps for x axis
        resize_step_x = 2,

        -- sets resize steps for y axis
        resize_step_y = 2,
      },
    },
    keys = {
      -- move between panes
      {
        "<C-h>",
        function()
          require("tmux").move_left()
        end,
        mode = "n",
      },
      {
        "<C-j>",
        function()
          require("tmux").move_down()
        end,
        mode = "n",
      },
      {
        "<C-k>",
        function()
          require("tmux").move_up()
        end,
        mode = "n",
      },
      {
        "<C-l>",
        function()
          require("tmux").move_right()
        end,
        mode = "n",
      },
      -- resize panes
      {
        "<M-h>",
        function()
          require("tmux").resize_left()
        end,
        mode = "n",
      },
      {
        "<M-j>",
        function()
          require("tmux").resize_down()
        end,
        mode = "n",
      },
      {
        "<M-k>",
        function()
          require("tmux").resize_up()
        end,
        mode = "n",
      },
      {
        "<M-l>",
        function()
          require("tmux").resize_right()
        end,
        mode = "n",
      },
    },
  },
}
