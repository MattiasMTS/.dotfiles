-- tmux windowzier
-- vim.keymap.set("n", "<C-e>", "<cmd>! tmux-windowizer<CR>", { desc = "Tmux Windowizer", silent = true })

-- persistance
-- vim.keymap.set("n", "<leader>s", "lua require('persistence').load()", { desc = "Load last session", silent = true })

-- Vertical movement babey
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- centers screen after jumping down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- centers screen after jumping up
vim.keymap.set("v", "n", "nzzzv") -- centers screen after jumping down
vim.keymap.set("v", "N", "Nzzzv") -- centers screen after jumping up

-- better indentation
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")

-- too lazy to reach ^ on swedish keyboard
vim.keymap.set("n", "<C-p>", "<cmd>e#<CR>", { desc = "Toggle between last open file", silent = true })

-- window management
vim.keymap.set("n", "<C-n>", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<C-s>", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<C-x>", "<C-w>c") -- close current window

-- quick hackz
vim.keymap.set("v", "J", ":m '>+2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>lg", function()
  -- local git_path = vim.api.nvim_buf_get_name(0)
  -- Util.terminal({ "lazygit", "-f", vim.trim(git_path) }, { esc_esc = false, ctrl_hjkl = false })
  _G.Snacks.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit current file history" })

-- remap lazy open
vim.keymap.del({ "n" }, "<leader>l")
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

-- local function format_markdown_table(input)
--   -- Split the input into lines
--   local lines = {}
--   for line in input:gmatch("[^\r\n]+") do
--     table.insert(lines, line)
--   end
--
--   -- Split each line into cells and find the maximum length of each cell
--   local max_lengths = {}
--   local cells = {}
--   local indents = {}
--   for _, line in ipairs(lines) do
--     local indent = line:match("^(%s*)") -- Get leading spaces
--     table.insert(indents, indent)
--     line = line:sub(#indent + 1) -- Remove leading spaces
--     local line_cells = {}
--     for cell in line:gmatch("[^|]+") do
--       cell = cell:match("^%s*(.-)%s*$") -- Trim whitespace
--       table.insert(line_cells, cell)
--       local cell_index = #line_cells
--       max_lengths[cell_index] = math.max(max_lengths[cell_index] or 0, #cell)
--     end
--     table.insert(cells, line_cells)
--   end
--
--   -- Format the table with padding
--   local formatted_lines = {}
--   for i, line_cells in ipairs(cells) do
--     local formatted_cells = {}
--     for j, cell in ipairs(line_cells) do
--       local padding = string.rep(" ", max_lengths[j] - #cell)
--       table.insert(formatted_cells, cell .. padding)
--     end
--     table.insert(formatted_lines, indents[i] .. table.concat(formatted_cells, " | "))
--   end
--
--   return table.concat(formatted_lines, "\n")
-- end

-- format sql unit test tables:
-- vim.keymap.set("v", "<leader>ft", function()
--   vim.notify("Formatting SQL table", "info", { title = "SQL Unit Test" })
--
--   -- Get the range of the selected text
--   local start_line = vim.fn.line("'<")
--   local end_line = vim.fn.line("'>")
--
--   -- Swap start and end lines if necessary
--   if start_line > end_line then
--     start_line, end_line = end_line, start_line
--   end
--
--   -- Get the lines from the buffer
--   local bufnr = vim.api.nvim_get_current_buf()
--   local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)
--
--   -- Concatenate the lines into a single string
--   local input = table.concat(lines, "\n")
--
--   -- Format the markdown table
--   local output = format_markdown_table(input)
--
--   -- Ensure start_line is less than or equal to end_line
--   local lower_line = math.min(start_line, end_line)
--   local upper_line = math.max(start_line, end_line)
--
--   -- Replace the selected lines with the formatted table
--   vim.api.nvim_buf_set_lines(bufnr, lower_line - 1, upper_line, false, vim.split(output, "\n"))
-- end)
