local Remap = require("mattias.keymap")
local nnoremap = Remap.nnoremap
local status_neogen, neogen = pcall(require, 'neogen')
if not status_neogen then
    return
end
