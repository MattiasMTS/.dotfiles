-- vim.keymap.set("t","<leader><Esc>", "<C-\\><C-n>") -- escape character from vi-terminal
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { silent = true }) -- escape character from vi-terminal
vim.keymap.set(
	"n",
	"<leader>tp",
	":TermExec cmd='ipython --autoindent --nosep --pprint --quick --autocall=0' direction='tab' <CR>",
	{ silent = true }
) -- open ipython in new tab
vim.keymap.set("n", "<leader>tn", ":ToggleTerm <CR>", { silent = true }) -- open terminal down
vim.keymap.set("n", "<leader>s", ":ToggleTermSendCurrentLine<CR>", { silent = true })
vim.keymap.set("v", "<leader>s", ":ToggleTermSendVisualLines<CR>", { silent = true })
vim.keymap.set("v", "<leader>s", ":ToggleTermSendVisualSelection<CR>", { silent = true })
