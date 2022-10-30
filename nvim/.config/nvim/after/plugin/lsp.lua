local Remap = require("mattias.keymap")
local nnoremap = Remap.nnoremap
local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
	print("cmp_nvim_lsp failed")
	return
end

local status2, lspconfig = pcall(require, "lspconfig")
if not status2 then
	print("lspconfig failed")
	return
end

-- enable keybinds only for when lsp server available
local on_attach = function()
	-- set keybinds
	nnoremap("gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
	nnoremap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
	nnoremap("gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
	nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
	nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions
	nnoremap("<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename for all places
	nnoremap("<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
	nnoremap("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
	nnoremap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
	nnoremap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
	nnoremap("K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
	nnoremap("<leader>o", "<cmd>LSoutlineToggle<CR>") -- see outline of the file on right hand side
end

local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- configure lua lsp
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- .lua files
lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- .yaml files
lspconfig.yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*.{yml,yaml}",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.{yml,yaml}",
				["kubernetes"] = "/*.{yml,yaml}",
			},
		},
	},
})

-- .py, .go, .sql/mysql files: .json
local servers = { "pyright", "gopls", "jsonls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end
