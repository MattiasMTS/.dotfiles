local status1, lspconfig = pcall(require, "lspconfig")
if not status1 then
	print("lspconfig failed")
	return
end

local status2, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status2 then
	print("cmp_nvim_lsp failed")
	return
end

local status3, fidget = pcall(require, "fidget")
if not status3 then
	print("fidget failed")
	return
end

-- Mappings.
local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<space>D", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>zz", bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)

	-- vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition <CR>zz", bufopts)

	vim.keymap.set("n", "<leader>ff", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- configure lua lsp
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lsp_config_on_buf = {
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
}

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup(lsp_config_on_buf)
	end,
	yamlls = function()
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
	end,
	gopls = function()
		lspconfig.gopls.setup({
			capability = capabilities,
			on_attach = on_attach,
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
						nilness = true,
						usenay = true,
					},
					staticcheck = true,
					gofumpt = true,
					usePlaceholders = true,
					experimentalPostfixCompletions = true,
					-- experimental
					codelenses = { test = true },
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		})
	end,
	sumneko_lua = function()
		lspconfig.sumneko_lua.setup(vim.tbl_extend("force", lsp_config_on_buf, {
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
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}))
	end,
})

fidget.setup({
	text = {
		spinner = "dots_ellipsis",
	},
	align = {
		bottom = false,
	},
	window = {
		relative = "editor",
		blend = 0, -- &winblend for the window
		zindex = nil, -- the zindex value for the window
		border = "none", -- style of border for the fidget window
	},
})
