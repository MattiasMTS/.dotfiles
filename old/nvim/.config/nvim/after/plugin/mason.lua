local status, mason = pcall(require, "mason")
if not status then
	print("mason failed")
	return
end

local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	print("mason-lspconfig failed")
	return
end

-- enable mason before lspconfig
mason.setup()
mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"sumneko_lua",
		"yamlls",
		"pyright",
		"gopls",
	},
	log_level = vim.log.levels.DEBUG,
})
