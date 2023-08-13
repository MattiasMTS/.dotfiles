vim.keymap.set("n", "<leader>db", ":! ~/env_dadbod.sh <CR> :tab :DBUI <CR>") -- open up the UI
vim.keymap.set("n", "<leader>dt", ":DBUIToggle <CR>") -- Toggle the sidebar
vim.keymap.set("n", "<leader>dl", ":DBUILastQueryInfo <CR>") -- What did you send to the query?
