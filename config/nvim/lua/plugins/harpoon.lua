return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    enabled = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("harpoon"):setup()
    end,
  -- stylua: ignore
    keys = {
      {"<leader>a", function() require("harpoon"):list():append() end, desc = "harpoon file", },
      {"<C-q>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
      {"<leader>1", function() require("harpoon"):list():select(1) end, desc = "jump to index 1"},
      {"<leader>2", function() require("harpoon"):list():select(2) end, desc = "jump to index 2"},
      {"<leader>3", function() require("harpoon"):list():select(3) end, desc = "jump to index 3"},
      {"<leader>4", function() require("harpoon"):list():select(4) end, desc = "jump to index 4"},
      {"<leader>5", function() require("harpoon"):list():select(5) end, desc = "jump to index 5"},
    },
  },
}
