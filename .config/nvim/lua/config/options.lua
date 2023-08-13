-- -- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- mouse
opt.mouse = "a" -- mouse allowed in all modes
opt.selectmode = "mouse,key"
--
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- winbar
-- opt.winbar = "%F %m"

opt.title = true
opt.hlsearch = true -- highlight search result, clear C-l
opt.incsearch = true -- look incremental
opt.swapfile = false
opt.backup = false -- use .nvim cache backup?
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.showcmd = true

-- Give more space for displaying messages.
opt.cmdheight = 1
opt.laststatus = 0 -- default 2
opt.inccommand = "nosplit" -- preview incremental substitute
opt.ignorecase = true
opt.list = true -- show some invisible characters (tabs, spaces..)

-- numbers on the left
opt.number = true
opt.relativenumber = true
opt.pumblend = 10 -- popup blend
opt.pumheight = 10 -- Maximum entries in popup group
--
opt.errorbells = false
opt.showmode = false -- status bar displayed using lualine

-- -- indent and formatting
-- -- opt.softtabstop = 4
-- opt.shiftwidth = 2 -- indent next line
-- opt.tabstop = 2 -- show tabs as 2 spaces
-- -- opt.linebreak = true -- soft wrap lines
-- opt.breakindent = true -- to see where lines breaks
-- opt.expandtab = true
-- opt.smartindent = true
-- opt.formatoptions = "jcroqlnt" -- tcqj

-- grep
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- extras
opt.backspace = "start,eol,indent"
opt.path:append({ "**" }) -- finding files, search down into subfolders
opt.clipboard = "unnamedplus" -- allow copy from vim to clipboard
opt.completeopt = "menu,menuone,noselect"

-- opt.showmatch = true
-- opt.wrap = false

-- Highlight stuff & cursor
opt.cursorline = true
opt.termguicolors = true
opt.guicursor = ""

opt.scrolloff = 10
opt.smoothscroll = true
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-- helps the rendering a bit?
-- vim.g.lazyredraw = true
opt.colorcolumn = "80"

-- language
opt.spelllang = { "en" }
--
-- cmd:
-- opt.wildmode = "longest:full,full" -- completion cli
--
-- -- floating windows
-- -- vim.api.nvim_open_win(0, false, { relative = "win", row = 3, col = 3, width = 12, height = 3, border = "solid" })
--
-- opt.splitkeep = "screen"
-- -- -- Don't pass messages to |ins-completion-menu|.
-- opt.shortmess:append("c")
-- -- opt.shortmess:append({ C = true })
-- -- if vim.fn.has("nvim-0.9.0") == 1 then
-- --   opt.splitkeep = "screen"
-- --   -- -- Don't pass messages to |ins-completion-menu|.
-- --   opt.shortmess:append("c")
-- --   -- opt.shortmess:append({ C = true })
-- -- end
