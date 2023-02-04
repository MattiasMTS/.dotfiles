local status, obsidian = pcall(require, "obsidian")
if not status then
	print("Obsidian failed")
end

obsidian.setup({
	dir = "~/Documents/GitHub/work/brainshare/users/mattiassjodin/",
	daily_notes = {
		folder = "dailies",
	},
	notes_subdir = "notes",
	completion = {
		nvim_cmp = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "markdown" },
	},
	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		local suffix = ""
		if title ~= nil then
			-- If title is given, transform it into valid file name.
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			-- If title is nil, just add 4 random uppercase letters to the suffix.
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,
})
