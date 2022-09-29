status, mason = pcall(require, 'mason')
if (not status) then return end
status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then return end

mason.setup {}
lspconfig.setup {
  ensure_installed = { 'sumneko_lua', 'yamlls', 'pyright', 'gopls', 'sqls' }
}

