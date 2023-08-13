local status, null_ls = pcall(require, "null-ls")
if not status then
	print("null-ls failed")
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
local code_actions = null_ls.builtins.code_actions -- gitsigns
local completion = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		-- completion
		completion.spell,

		-- diagnostics
		diagnostics.eslint_d,
		diagnostics.actionlint,
		diagnostics.staticcheck,
		diagnostics.shellcheck,
		diagnostics.codespell,
		diagnostics.protolint,
		diagnostics.cfn_lint,

		-- code actions
		code_actions.refactoring,

		-- formatting
		formatting.golines,
		formatting.goimports,
		formatting.prettier,
		formatting.sqlfluff,
		formatting.stylua,
		formatting.isort.with({
			extra_args = {
				"--profile=black",
				"--trailing-comma",
				"--use-parentheses",
				"--ensure-newline-before-comments",
			},
		}),
		formatting.black.with({
			extra_args = {
				"--line-length",
				"90",
				"--fast",
			},
		}),
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
