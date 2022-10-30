local status, null_ls = pcall(require, "null-ls")
if not status then
	print("null-ls failed")
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
local code_actions = null_ls.builtins.code_actions -- gitsigns

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		-- code actions
		code_actions.gitsigns,
		code_actions.refactoring,
		code_actions.gitrebase,
        code_actions.eslint_d,
		-- formatting
		formatting.prettier,
		formatting.sql_formatter,
		formatting.stylua, -- lua formatter
		formatting.isort,
		formatting.black,
		formatting.sqlfluff,

		-- diagnostics
		diagnostics.eslint_d,
		-- diagnostics.flake8,
		-- diagnostics.mypy,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
