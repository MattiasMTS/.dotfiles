-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- add lazy to runtimepath
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Plugins here is set against the cwd of lua/ folder
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        news = {
          lazyvim = true,
          neovim = true,
        },
      },
    },

    -- these are all defined here:
    -- https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/plugins

    -- LSP specifics
    { import = "lazyvim.plugins.extras.lang.go" },
    -- { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    -- { import = "lazyvim.plugins.extras.lang.python" }, -- venv selector etc
    { import = "lazyvim.plugins.extras.lang.python-semshi" }, -- experimential semantic highlights in python
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.markdown" },

    -- debugger
    -- { import = "lazyvim.plugins.extras.dap.core" },

    -- editor.lua
    { import = "lazyvim.plugins.extras.editor.symbols-outline" },
    { import = "lazyvim.plugins.extras.editor.navic" },

    -- formatting
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    -- { import = "lazyvim.plugins.extras.formatting.black" },

    -- other
    -- { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

    -- load custom plugins
    { import = "plugins" },
  },
  dev = {
    path = vim.fn.expand("$HOME") .. "/src/github.com/projects",
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- false == always use the latest git commit
    keymaps = true, -- lazyvim.config.keymaps, default true
    autocmds = true, -- lazyvim.config.autocmds, default true
  },
  install = {
    colorscheme = { "rose-pine" },
  },

  checker = { enabled = false }, -- check for updates
  change_detection = {
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
