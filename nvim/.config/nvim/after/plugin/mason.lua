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

local status3, mason_null_ls = pcall(require, "mason-null-ls")
if not status3 then
	print("mason-null-ls failed")
	return
end

-- enable mason
mason.setup()

-- lsp manager setup
mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"sumneko_lua",
		"yamlls",
		"pyright",
		"gopls",
		"jsonls",
		"sqls",
	},
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.DEBUG,
})

-- null-ls setup
mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- yml/yaml/toml/json formatter
		"stylua", -- lua formatter
		"eslint_d",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
