return {
  {
    "OXY2DEV/markview.nvim",
    enabled = true,
    ft = "markdown",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("markview").setup({
        -- Uses this feature on normal mode
        modes = { "n", "i", "no", "c" },
        hybrid_modes = { "n", "i" },

        -- This is nice to have
        callbacks = {
          on_enable = function(_, win)
            vim.wo[win].conceallevel = 2
            vim.wo[win].concealcursor = "c"
          end,
        },
      })
    end,
  },
}
