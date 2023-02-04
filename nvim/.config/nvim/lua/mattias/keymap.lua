-- Vertical movement babey
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- window management
vim.keymap.set("n", "<leader>wn", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>ww", "<C-w>w") -- jump between windows
vim.keymap.set("n", "<leader>ws", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>wr", "<C-w>r") -- switch tab places
vim.keymap.set("n", "<leader>we", "<C-w>=") -- split windows equal in size
vim.keymap.set("n", "<leader>wc", "<C-w>c") -- close current window
vim.keymap.set("n", "<leader>wo", "<C-w>o") -- close other windows than this
vim.keymap.set("n", "<leader>wh", "<C-w>h") -- jump to the left window
vim.keymap.set("n", "<leader>wj", "<C-w>j") -- jump to the window below
vim.keymap.set("n", "<leader>wk", "<C-w>k") -- jump to the window above
vim.keymap.set("n", "<leader>wl", "<C-w>l") -- jump to the right window
vim.keymap.set("n", "<leader>wH", "<C-w>H")
vim.keymap.set("n", "<leader>wJ", "<C-w>J")
vim.keymap.set("n", "<leader>wK", "<C-w>K")
vim.keymap.set("n", "<leader>wL", "<C-w>L")
vim.keymap.set("n", "<leader>wp", "<C-w>p") -- jump to the right window
vim.keymap.set("n", "<leader>wi", "<C-w>>+20") -- increase width (vertical)
vim.keymap.set("n", "<leader>wd", "<C-w><-20") -- decrease width (vertical)
vim.keymap.set("n", "<leader>wv", "<C-w>|") -- Set current window width to N (default: widest possible)

-- tab management
vim.keymap.set("n", "<leader>th", ":tabp<CR>", { silent = true }) -- go to previous tab
vim.keymap.set("n", "<leader>tl", ":tabn<CR>", { silent = true }) -- go to next tab
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true }) -- open new tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true }) -- close current tab

-- quick hackz
vim.keymap.set("n", "<leader><leader>p", ":Ex<CR>", { silent = true }) -- open the Explore
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader><leader>f", function()
	vim.lsp.buf.format()
end)
