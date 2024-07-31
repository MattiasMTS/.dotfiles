return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
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
  {
    "almo7aya/openingh.nvim",
    enabled = false,
    cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
    keys = {
      { "<leader>ghl", "<cmd>OpenInGHFileLines<CR>", desc = "Open in GitHub File Lines" },
      { "<leader>ghr", "<cmd>OpenInGHRepo<CR>", desc = "Open in GitHub Repo" },
      { "<leader>ghf", "<cmd>OpenInGHFile<CR>", desc = "Open in GitHub File" },
    },
  },
}
