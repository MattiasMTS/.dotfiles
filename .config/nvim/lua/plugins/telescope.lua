return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    cmd = { "Telescope" },
    keys = {
      { "gf", "<cmd>Telescope git_files<CR>", desc = "Find git files", silent = true, mode = "n" },
      { "pf", "<cmd>Telescope find_files<CR>", desc = "Find files", silent = true, mode = "n" },
      { "pw", "<cmd>Telescope live_grep<CR>", desc = "Live grep", silent = true, mode = "n" },
      { "ps", "<cmd>Telescope grep_string<CR>", desc = "Grep string", silent = true, mode = "n" },
      { "pb", "<cmd>Telescope buffers<CR>", desc = "Buffers", silent = true, mode = "n" },
      { "vh", "<cmd>Telescope help_tags<CR>", desc = "Help tags", silent = true, mode = "n" },
    },
    -- opt = function()
    --   local actions = require("telescope.actions")
    --   local previewers = require("telescope.previewers")
    --   local fb_actions = require("telescope").extensions.file_browser.actions
    --
    --   require("telescope").setup({
    --     defaults = {
    --       vimgrep_arguments = {
    --         "rg",
    --         "-L",
    --         "--color=never",
    --         "--no-heading",
    --         "--with-filename",
    --         "--line-number",
    --         "--column",
    --         "--smart-case",
    --       },
    --       prompt_prefix = "> ",
    --       selection_caret = "> ",
    --       entry_prefix = "  ",
    --       multi_icon = "<>",
    --       path_display = { "smart" },
    --
    --       winblend = 0,
    --
    --       layout_strategy = "horizontal",
    --       layout_config = {
    --         width = 0.95,
    --         height = 0.85,
    --         -- preview_cutoff = 120,
    --         prompt_position = "top",
    --
    --         horizontal = {
    --           preview_width = function(_, cols, _)
    --             if cols > 200 then
    --               return math.floor(cols * 0.4)
    --             else
    --               return math.floor(cols * 0.6)
    --             end
    --           end,
    --         },
    --
    --         vertical = {
    --           width = 0.9,
    --           height = 0.95,
    --           preview_height = 0.5,
    --         },
    --
    --         flex = {
    --           horizontal = {
    --             preview_width = 0.9,
    --           },
    --         },
    --       },
    --
    --       selection_strategy = "reset",
    --       sorting_strategy = "ascending",
    --       scroll_strategy = "cycle",
    --       color_devicons = true,
    --       mappings = {
    --         ["i"] = {
    --           ["<C-x>"] = false,
    --           ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
    --           ["<C-k>"] = actions.move_selection_previous,
    --           ["<C-j>"] = actions.move_selection_next,
    --         },
    --         ["n"] = {
    --           ["-"] = fb_actions.goto_parent_dir,
    --         },
    --       },
    --       file_sorter = require("telescope.sorters").get_fzy_sorter,
    --       file_ignore_patterns = { "node_modules" },
    --       file_previewer = previewers.vim_buffer_cat.new,
    --       grep_previewer = previewers.vim_buffer_vimgrep.new,
    --       qflist_previewer = previewers.vim_buffer_qflist.new,
    --     },
    --     history = {
    --       path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
    --       limit = 100,
    --     },
    --     -- default themes for the telescope functions
    --     pickers = {
    --       find_files = {
    --         all_previewers = true,
    --         respect_gitignore = true,
    --         hijack_netrw = true,
    --         hidden = false,
    --         grouped = true,
    --         initial_mode = "insert",
    --       },
    --       git_files = {
    --         all_previewers = true,
    --         hijack_netrw = true,
    --         hidden = false,
    --         grouped = true,
    --         initial_mode = "insert",
    --       },
    --       grep_string = {},
    --       live_grep = {},
    --       file_browser = {
    --         hidden = false,
    --       },
    --     },
    --     extensions = {
    --       fzf = {
    --         fuzzy = true,                   -- false will only do exact matching
    --         override_generic_sorter = true, -- override the generic sorter
    --         override_file_sorter = true,    -- override the file sorter
    --         case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    --       },
    --       ["ui-select"] = {
    --         require("telescope.themes").get_dropdown({
    --           -- pseudo code / specification for writing custom displays, like the one
    --           -- for "codeactions"
    --           -- specific_opts = {
    --           --   [kind] = {
    --           --     make_indexed = function(items) -> indexed_items, width,
    --           --     make_displayer = function(widths) -> displayer
    --           --     make_display = function(displayer) -> function(e)
    --           --     make_ordinal = function(e) -> string
    --           --   },
    --           --   -- for example to disable the custom builtin "codeactions" display
    --           --      do the following
    --           --   codeactions = false,
    --           -- }
    --         }),
    --       },
    --     },
    --   })
    --   require("telescope").load_extension("fzf")
    --   require("telescope").load_extension("file_browser")
    --   require("telescope").load_extension("refactoring")
    --   require("telescope").load_extension("ui-select")
    -- end,
  },
}
