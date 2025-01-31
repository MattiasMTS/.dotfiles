return {
  {
    "3rd/image.nvim",
    ft = { "markdown", "vimwiki", "html" },
    enabled = true,
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      integrations = {
        markdown = {
          clear_in_insert_mode = false,
          only_render_image_at_cursor = false,
          only_render_image_at_cursor_mode = "popup",
        },
        html = {
          filetypes = { "html", "xhtml", "htm", "markdown" },
        },
      },
      max_width_window_percentage = 100,
      max_height_window_percentage = false,
      window_overlap_clear_enabled = true,
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
  {
    "3rd/diagram.nvim",
    ft = { "markdown" },
    enabled = false,
    depends = { "3rd/image.nvim" },
    opts = {
      renderer_options = {
        mermaid = {
          background = "transparent",
          theme = "dark",
        },
      },
    },
  },
}
