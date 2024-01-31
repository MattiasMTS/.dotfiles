-- tmux windowzier
-- vim.keymap.set("n", "<C-e>", "<cmd>! tmux-windowizer<CR>", { desc = "Tmux Windowizer", silent = true })

-- persistance
-- vim.keymap.set("n", "<leader>s", "lua require('persistence').load()", { desc = "Load last session", silent = true })

-- Vertical movement babey
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- centers screen after jumping down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- centers screen after jumping up
vim.keymap.set("v", "n", "nzzzv") -- centers screen after jumping down
vim.keymap.set("v", "N", "Nzzzv") -- centers screen after jumping up

-- better indentation
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")

-- window management
vim.keymap.set("n", "<C-n>", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<C-s>", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<C-x>", "<C-w>c") -- close current window

-- quick hackz
vim.keymap.set("v", "J", ":m '>+2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- -- toggleterm
-- vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { silent = true }) -- escape character from vi-terminal

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit", silent = true })

-- remap lazy open
vim.keymap.del({ "n" }, "<leader>l")
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
