return {
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    keys = {
      {
        "<leader>md",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
  },
  {
    "toppair/peek.nvim",
    enabled = false,
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>md",
        function()
          local peek = require("lua.plugins.markdown")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = {
      theme = "light",
    },
  },
  {
    "OXY2DEV/markview.nvim",
    enabled = true,
    ft = "markdown",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
