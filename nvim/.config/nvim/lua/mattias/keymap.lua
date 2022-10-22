local M = {}
local keymap = vim.keymap

function bind(op, outer_opts)
    outer_opts = outer_opts or {
        noremap = true,
        silent = true,
    }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
--
-- window management
M.nnoremap("<leader>wv", "<C-w>v") -- split window vertically
M.nnoremap("<leader>ww", "<C-w>w") -- jump between windows
M.nnoremap("<leader>ws", "<C-w>s") -- split window horizontally
M.nnoremap("<leader>wr", "<C-w>r") -- switch tab places
M.nnoremap("<leader>we", "<C-w>=") -- split windows equal in size
M.nnoremap("<leader>wx", "<C-w>x") -- close current window
M.nnoremap("<leader>wo", "<C-w>o") -- close other windows than this

-- tab management
M.nnoremap("<leader>to", ":tabnew<CR>") -- open new tab
M.nnoremap("<leader>tx", ":tabclose<CR>") -- close current tab
M.nnoremap("<leader>tn", ":tabn<CR>") -- go to next tab
M.nnoremap("<leader>tp", ":tabp<CR>") -- go to previous tab

return M
