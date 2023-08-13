return {
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      persist_mode = true,
      hidden = false,
      size = function(term)
        if term.direction == "horizontal" then
          return 25
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      hide_numbers = true, -- hide the number column in toggleterm buffers
      start_in_insert = true,
      close_on_exit = true, -- close the terminal window when the process exits
      auto_scroll = true,
      clear_env = false,
      direction = "horizontal",
      shell = "zsh",
    },
    keys = function()
      return {
        {
          "tn",
          "<cmd>ToggleTerm <CR>",
          desc = "open latest toggleterm",
          silent = true,
          mode = "n",
        },
        {
          "s",
          "<cmd>ToggleTermSendCurrentLine ipython<CR>",
          desc = "Send current line to toggleterm",
          -- noremap = true,
          silent = true,
          expr = false,
          mode = "n",
        },
        {
          "s",
          "<cmd>:'<,'>ToggleTermSendVisualSelection ipython<CR>",
          desc = "Send current visual line to toggleterm",
          -- noremap = true,
          silent = true,
          expr = false,
          mode = "v",
        },
      }
    end,
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      -- IPython repl
      local ipython = Terminal:new({
        cmd = "ipython --autoindent --nosep --pprint --quick --autocall=0",
        hidden = true,
        direction = "vertical",
        start_in_insert = false,
      })

      -- Monitor resources
      local btop = Terminal:new({
        cmd = "btop",
        hidden = true,
        direction = "float",
        highlights = {
          FloatBorder = { guibg = "Black", guifg = "DarkGray" },
          NormalFloat = { guibg = "Black" },
        },
      })

      -- github TUI
      local gh_dash = Terminal:new({
        cmd = "gh dash",
        hidden = true,
        direction = "float",
        float_opts = {
          height = function()
            return math.floor(vim.o.lines * 0.8)
          end,
          width = function()
            return math.floor(vim.o.columns * 0.95)
          end,
        },
      })

      -- lazy docker
      local lazy_docker = Terminal:new({
        cmd = "lazydocker",
        hidden = true,
        direction = "float",
        dir = "git_dir",
        float_opts = {
          height = function()
            return math.floor(vim.o.lines * 0.85)
          end,
          width = function()
            return math.floor(vim.o.columns * 0.95)
          end,
        },
      })

      vim.keymap.set("n", "<leader>ld", function()
        lazy_docker:toggle()
      end, {
        desc = "toggleterm: toggle lazydocker",
      })

      vim.keymap.set("n", "<leader>gd", function()
        gh_dash:toggle()
      end, {
        desc = "toggleterm: toggle github dashboard",
      })

      vim.keymap.set("n", "<leader>bt", function()
        btop:toggle()
      end, {
        desc = "toggleterm: btop",
      })

      -- ipython bindings
      vim.keymap.set("n", "<leader>tp", function()
        ipython:toggle()
      end, {
        desc = "toggleterm: IPython REPL",
      })
    end,
  },
}
