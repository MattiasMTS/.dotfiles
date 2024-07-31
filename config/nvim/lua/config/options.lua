-- -- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- therefore some of the ones below are commented out

-- trying this out we'll see
-- vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_python_ruff = "ruff"

-- vim.g.autoformat = true -- lazyvim enabled

-- mouse
vim.opt.mouse = "a" -- mouse allowed in all modes

-- Show whitespace.
vim.opt.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.hlsearch = true -- highlight search result, clear C-l
vim.opt.incsearch = true -- look incremental
vim.opt.swapfile = false
vim.opt.showcmd = true
vim.opt.inccommand = "split" -- preview incremental substitute -- lazyvim
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.splitright = true -- split to the right
vim.opt.splitbelow = true -- split below

-- Give more space for displaying messages.
vim.opt.cmdheight = 0 -- NOTE: trying noice.nvim -> want this 0 then
vim.o.laststatus = 3 -- default 2

-- numbers on the left
vim.opt.number = true -- lazyvim enabled
vim.opt.relativenumber = true -- lazyvim enabled
vim.opt.signcolumn = "number"

-- opt.pumblend = 10 -- popup blend
-- opt.pumheight = 10 -- Maximum entries in popup group
--
vim.opt.errorbells = false
vim.opt.showmode = false -- status bar displayed using lualine -- lazyvim

-- indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- grep
-- opt.grepformat = "%f:%l:%c:%m" -- lazyvim enabled
-- opt.grepprg = "rg --vimgrep" -- lazyvim enabled

-- extras
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" }) -- finding files, search down into subfolders
-- opt.clipboard = "unnamedplus" -- allow copy from vim to clipboard lazyvim
-- opt.completeopt = "menu,menuone,noselect" -- lazyvim enabled

-- Completion.
vim.opt.wildignore:append({ ".DS_Store" })
-- vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.pumheight = 15

-- Highlight stuff & cursor
vim.opt.cursorline = true -- highlight current line
-- opt.termguicolors = true -- lazyvim enabled
-- opt.guicursor = "" -- enable if you want block when insertmode
-- opt.guicursor = "n-v-c:blinkon250-blinkoff250"

vim.opt.scrolloff = 10
-- if vim version is 10 or higher, apply the code below:
-- opt.smoothscroll = true
-- opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- language
vim.opt.spelllang = { "en" }
