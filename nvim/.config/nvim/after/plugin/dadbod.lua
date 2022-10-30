local status1, cmp = pcall(require, "cmp")
if not status1 then
	print("cmp fail dadbod")
end

local status2, plenarypath = pcall(require, "plenary.path")
if not status2 then
	print("plenarypath fail dadbod")
end

local M = {}

local function db_completion()
	cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
end

function M.setup()
	vim.g.db_ui_save_location = vim.fn.stdpath("config") .. plenarypath.path.sep .. "db_ui"

	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"sql",
		},
		command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
	})

	-- activate dadbod-cmp on these file types
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"sql",
			"mysql",
			"plsql",
		},
		callback = function()
			vim.schedule(db_completion)
		end,
	})
end

return M
