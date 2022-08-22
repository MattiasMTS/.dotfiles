vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.showcmd = true
-- Give more space for displaying messages.
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.shell = 'oh-my-zsh'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.ai = true  -- auto indent
vim.opt.si = true  -- smart indent
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' }  -- finding files, search down into subfolders

vim.opt["clipboard"] = "unnamedplus"  -- allow copy from vim to clipboard
vim.opt["completeopt"] = {"menuone", "noselect"} -- for cmp

vim.opt.showmatch = true
vim.opt.wrap = false

-- Highlight stuff
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")


-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- according to PEP-8 convention
vim.opt.colorcolumn = "80"

-- mapleader
vim.g.mapleader = " "

-- TODO check for undercurl once fixed for iTerm2?
