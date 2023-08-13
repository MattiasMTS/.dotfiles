-- local util = require("lazyvim.util")
-- vim.keymap.del({ "n", "x" }, "gw")
-- vim.keymap.set("n", "<leader>uL", function()
--   util.toggle("list")
-- end, { desc = "Toggle List" })

-- need to have these here
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to Buffer 1", silent = true })
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to Buffer 2", silent = true })
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to Buffer 3", silent = true })
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to Buffer 4", silent = true })
vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to Buffer 5", silent = true })
vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to Buffer 6", silent = true })
vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to Buffer 7", silent = true })
vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to Buffer 8", silent = true })
vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to Buffer 9", silent = true })

-- Vertical movement babey
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "n", "nzzzv")
vim.keymap.set("v", "N", "Nzzzv")

-- better indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- -- obsidian
-- vim.keymap.del({ "n" }, "gf")

-- -- window management
-- vim.keymap.set("n", "<leader>wn", "<C-w>v") -- split window vertically
-- vim.keymap.set("n", "<leader>ww", "<C-w>w") -- jump between windows
-- vim.keymap.set("n", "<leader>ws", "<C-w>s") -- split window horizontally
-- vim.keymap.set("n", "<leader>wr", "<C-w>r") -- switch tab places
-- vim.keymap.set("n", "<leader>we", "<C-w>=") -- split windows equal in size
-- vim.keymap.set("n", "<leader>wc", "<C-w>c") -- close current window
-- vim.keymap.set("n", "<leader>wo", "<C-w>o") -- close other windows than this
-- vim.keymap.set("n", "<leader>wh", "<C-w>h") -- jump to the left window
-- vim.keymap.set("n", "<leader>wj", "<C-w>j") -- jump to the window below
-- vim.keymap.set("n", "<leader>wk", "<C-w>k") -- jump to the window above
-- vim.keymap.set("n", "<leader>wl", "<C-w>l") -- jump to the right window
-- vim.keymap.set("n", "<leader>wH", "<C-w>H")
-- vim.keymap.set("n", "<leader>wJ", "<C-w>J")
-- vim.keymap.set("n", "<leader>wK", "<C-w>K")
-- vim.keymap.set("n", "<leader>wL", "<C-w>L")
-- vim.keymap.set("n", "<leader>wp", "<C-w>p") -- jump to the right window
-- vim.keymap.set("n", "<leader>wi", "<C-w>>+20") -- increase width (vertical)
-- vim.keymap.set("n", "<leader>wd", "<C-w><-20") -- decrease width (vertical)
-- vim.keymap.set("n", "<leader>wv", "<C-w>|") -- Set current window width to N (default: widest possible)

-- experimental window management
vim.keymap.set("n", "<C-n>", "<C-w>v") -- split window vertically
-- vim.keymap.set("n", "<C-w>", "<C-w>w") -- jump between windows
vim.keymap.set("n", "<C-s>", "<C-w>s") -- split window horizontally
-- vim.keymap.set("n", "<C-r>", "<C-w>r") -- switch tab places
vim.keymap.set("n", "<C-e>", "<C-w>=") -- split windows equal in size
vim.keymap.set("n", "<C-x>", "<C-w>c") -- close current window
-- vim.keymap.set("n", "<C-o>", "<C-w>o") -- close other windows than this
-- fulfilled by vim-tmux-navigator plugin
-- vim.keymap.set("n", "<C-h>", "<C-w>h") -- jump to the left window
-- vim.keymap.set("n", "<C-j>", "<C-w>j") -- jump to the window below
-- vim.keymap.set("n", "<C-k>", "<C-w>k") -- jump to the window above
-- vim.keymap.set("n", "<C-l>", "<C-w>l") -- jump to the right window
-- vim.keymap.set("n", "<C-+>", "<C-w>>+21") -- increase width (vertical)
-- vim.keymap.set("n", "<C-->", "<C-w><-20") -- decrease width (vertical)
-- vim.keymap.set("n", "<C-v>", "<C-w>|") -- Set current window width to N (default: widest possible)

-- tab management
vim.keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { silent = true }) -- go to previous tab
vim.keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { silent = true }) -- go to next tab
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { silent = true }) -- open new tab
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { silent = true }) -- close current tab

-- quick hackz
vim.keymap.set("v", "J", ":m '>+2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- toggleterm
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { silent = true }) -- escape character from vi-terminal

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit", silent = true })

-- remap lazy open
vim.keymap.del({ "n" }, "<leader>l")
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

-- dadbod TODO: fix this
vim.keymap.set("n", "<leader>DB", "<cmd>:DBUI<CR>", { desc = "Open Dadbod UI", silent = true })
