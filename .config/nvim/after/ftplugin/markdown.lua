vim.opt_local.colorcolumn = "100"
vim.opt_local.textwidth = 100
vim.opt_local.spell = true
vim.opt_local.linebreak = true
vim.opt_local.spelllang = "en"
vim.opt_local.concealcursor = "nv"
vim.opt_local.formatoptions = "tcqjn"
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Auto Correct", silent = false })
