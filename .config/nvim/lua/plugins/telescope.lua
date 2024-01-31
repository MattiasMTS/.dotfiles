return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
        -- require("telescope").load_extension("ui-select")
      end,
    },
    cmd = { "Telescope" },
    keys = {
      -- TODO: add pcall here to protect from when we are not in a git repository.
      {
        "gf",
        function()
          require("telescope.builtin").git_files({ hidden = true })
        end,
        desc = "Find git files",
        silent = true,
        mode = "n",
      },
      {
        "pf",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find files",
        silent = true,
        mode = "n",
      },
      { "pw", "<cmd>Telescope live_grep<CR>", desc = "Live grep", silent = true, mode = "n" },
      { "ps", "<cmd>Telescope grep_string<CR>", desc = "Grep string", silent = true, mode = "n" },
      -- TODO: add deletion to list buffers
      { "pb", "<cmd>Telescope buffers<CR>", desc = "Buffers", silent = true, mode = "n" },
      { "vh", "<cmd>Telescope help_tags<CR>", desc = "Help tags", silent = true, mode = "n" },
      {
        "<leader>/",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
            promp_position = "top",
            sorting_strategy = "ascending",
          }))
        end,
        desc = "Search in current buffer",
        silent = true,
        mode = "n",
        noremap = true,
      },
    },
  },
}
