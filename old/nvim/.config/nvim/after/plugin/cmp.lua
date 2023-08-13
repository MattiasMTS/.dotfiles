local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	print("cmp failed")
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	print("luasnip failed")
	return
end

-- local lspkind_status, lspkind = pcall(require, "lspkind")
-- if not lspkind_status then
-- 	print("lspkind failed")
-- 	return
-- end
--
-- load friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = { "menuone", "noselect", "noinsert" } --, "preview" }
-- shortmess is used to avoid excessive messages
vim.opt.shortmess = vim.opt.shortmess + { c = true }

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

cmp.setup({
	completion = {
		-- completeopt manages the code suggestions.
		-- menuone = show menu even if only one suggestion
		-- noinsert: only insert text when selection is confirmed
		-- noselect forcee us to select one from the suggestion
		completeopt = "menuone,noselect,noinsert", --,preview",
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- for "luasnip" users
		end,
	},
	-- how to interact with the autocompletion popup window
	mapping = {
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	sources = {
		{ name = "path" }, -- file system paths
		{ name = "nvim_lsp" }, -- get lsp to work
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "buffer" }, -- text within current buffer
		{ name = "luasnip" }, -- snippets
		{ name = "vim-dadbod-completion" }, -- Database autocompletion
	},
	-- formatting = {
	-- 	fields = { "menu", "abbr", "kind" },
	-- 	format = function(entry, item)
	-- 		local menu_icon = {
	-- 			nvim_lsp = "λ",
	-- 			vsnip = "⋗",
	-- 			buffer = "b",
	-- 			path = "p",
	-- 		}
	-- 		item.menu = menu_icon[entry.source.name]
	-- 		return item
	-- 	end,
	-- },
	-- formatting = {
	-- 	format = lspkind.cmp_format({
	-- 		mode = "symbol", -- show only symbol annotations
	-- 		maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
	-- 		ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
	-- 	}),
	-- },
})
