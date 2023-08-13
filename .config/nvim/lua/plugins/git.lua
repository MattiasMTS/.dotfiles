return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    -- event = "VeryLazy",
    -- keys = {
    --   { "n", "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit", silent = true },
    -- },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      -- signs = {
      --   add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      --   change = {
      --     hl = "GitSignsChange",
      --     text = "│",
      --     numhl = "GitSignsChangeNr",
      --     linehl = "GitSignsChangeLn",
      --   },
      --   delete = {
      --     hl = "GitSignsDelete",
      --     text = "_",
      --     numhl = "GitSignsDeleteNr",
      --     linehl = "GitSignsDeleteLn",
      --   },
      --   topdelete = {
      --     hl = "GitSignsDelete",
      --     text = "‾",
      --     numhl = "GitSignsDeleteNr",
      --     linehl = "GitSignsDeleteLn",
      --   },
      --   changedelete = {
      --     hl = "GitSignsChange",
      --     text = "~",
      --     numhl = "GitSignsChangeNr",
      --     linehl = "GitSignsChangeLn",
      --   },
      -- },
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 500, -- unit in ms
        ignore_whitespace = false,
        virt_text_priority = 200,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
    },
  },
}
