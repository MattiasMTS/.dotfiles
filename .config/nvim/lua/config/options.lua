-- -- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- therefore some of the ones below are commented out

local opt = vim.opt

-- vim.g.autoformat = true -- lazyvim enabled

-- mouse
opt.mouse = "a" -- mouse allowed in all modes
-- opt.selectmode = "mouse,key"
--
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- winbar
opt.winbar = "%F %m"
-- opt.winbar = "%f"

-- opt.title = true
opt.hlsearch = true -- highlight search result, clear C-l
opt.incsearch = true -- look incremental
opt.swapfile = false
-- opt.backup = false -- use .nvim cache backup?
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- opt.undofile = true -- lazyvim enabled
opt.showcmd = true

-- Give more space for displaying messages.
opt.cmdheight = 1
-- opt.laststatus = 0 -- default 2
-- opt.inccommand = "nosplit" -- preview incremental substitute -- lazyvim
-- opt.ignorecase = true -- lazyvim
-- opt.list = true -- show some invisible characters (tabs, spaces..) -- lazyvim

-- numbers on the left
opt.number = true -- lazyvim enabled
-- opt.relativenumber = true -- lazyvim enabled
-- opt.pumblend = 10 -- popup blend
-- opt.pumheight = 10 -- Maximum entries in popup group
--
opt.errorbells = false
opt.showmode = false -- status bar displayed using lualine -- lazyvim

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
-- opt.grepformat = "%f:%l:%c:%m" -- lazyvim enabled
-- opt.grepprg = "rg --vimgrep" -- lazyvim enabled

-- extras
opt.backspace = "start,eol,indent"
opt.path:append({ "**" }) -- finding files, search down into subfolders
-- opt.clipboard = "unnamedplus" -- allow copy from vim to clipboard lazyvim
-- opt.completeopt = "menu,menuone,noselect" -- lazyvim enabled

-- Highlight stuff & cursor
opt.cursorline = false
-- opt.termguicolors = true -- lazyvim enabled
opt.guicursor = ""
-- opt.guicursor = "n-v-c:blinkon250-blinkoff250"

opt.scrolloff = 10
-- if vim version is 10 or higher, apply the code below:
-- opt.smoothscroll = true
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
