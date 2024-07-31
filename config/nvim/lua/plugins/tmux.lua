return {
  {
    "christoomey/vim-tmux-navigator",
    enabled = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", mode = "n" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", mode = "n" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", mode = "n" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", mode = "n" },
    },
  },
  {
    "aserowy/tmux.nvim",
    enabled = true,
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
  {
    "EvWilson/slimux.nvim",
    enabled = false,
    config = function()
      local slimux = require("slimux")
      slimux.setup({
        target_socket = slimux.get_tmux_socket(),
        target_pane = string.format("%s.2", slimux.get_tmux_window()),
        escaped_strings = { "\\", ";", '"', "$" },
      })
      vim.keymap.set(
        "v",
        "<leader>r",
        slimux.send_highlighted_text,
        { desc = "Send currently highlighted text to configured tmux pane" }
      )
      vim.keymap.set(
        "n",
        "<leader>r",
        slimux.send_paragraph_text,
        { desc = "Send paragraph under cursor to configured tmux pane" }
      )
    end,
  },
}
