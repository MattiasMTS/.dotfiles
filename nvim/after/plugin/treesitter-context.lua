local status, tc = pcall(require, 'treesitter-context')
if (not status) then return end
local nnoremap = require("mattias.keymap").nnoremap

function ContextSetup(show_all_context)
    tc.setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        show_all_context = show_all_context,
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
                "class",
                "function",
                "method",
                "for",
                "while",
                "if",
                "switch",
                "case",
            },

            -- Patterns for specific filetypes
            -- If a pattern is missing, *open a PR* so everyone can benefit.
            tex = {
                'chapter',
                'section',
                'subsection',
                'subsubsection',
            },
            rust = {
                'impl_item',
                'struct',
                'enum',
            },
            scala = {
                'object_definition',
            },
            vhdl = {
                'process_statement',
                'architecture_body',
                'entity_declaration',
            },
            markdown = {
                'section',
            },
            elixir = {
                'anonymous_function',
                'arguments',
                'block',
                'do_block',
                'list',
                'map',
                'tuple',
                'quoted_content',
            },
            json = {
                'pair',
            },
            yaml = {
                'block_mapping_pair',
            },
        },
    })
end

nnoremap("<leader>cf", function() ContextSetup(true) end)
nnoremap("<leader>cp", function() ContextSetup(false) end)
ContextSetup(false)
