-- mapleader
vim.g.mapleader = " "

-- mouse
vim.opt.mouse = "a" -- mouse allowed in all modes
vim.opt.selectmode = "mouse,key"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- Ignore compiled files
vim.cmd("set wildignore+=*/tags,*/tmp/*,/var/*,*.a,*.o,*.obj,*.so,*.swp,*.zip,*.tar,*.pyc,*__pycache__")

vim.opt.title = true
vim.opt.hlsearch = true -- highlight search result, clear C-l
vim.opt.incsearch = true -- look incremental
vim.opt.swapfile = false
vim.opt.backup = false -- use .nvim cache backup?
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.showcmd = true

-- Give more space for displaying messages.
vim.opt.cmdheight = 1
vim.opt.laststatus = 0 -- default 2
vim.opt.inccommand = "split"
vim.opt.ignorecase = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.errorbells = false
vim.opt.showmode = false -- status bar displayed using lualine

-- indent and formatting
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- indent next line
vim.opt.tabstop = 4 -- show tabs as 4 spaces
vim.opt.linebreak = true -- soft wrap lines
vim.opt.breakindent = true -- to see where lines breaks
vim.opt.expandtab = true
vim.opt.smartindent = true

-- extras
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" }) -- finding files, search down into subfolders
vim.opt["clipboard"] = "unnamedplus" -- allow copy from vim to clipboard

vim.opt.showmatch = true
vim.opt.wrap = false

-- Highlight stuff
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.guicursor = ""

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- helps the rendering a bit?
vim.g.lazyredraw = true

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "80"
