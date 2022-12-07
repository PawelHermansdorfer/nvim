local plugin_name = "telescope"
local status, plugin = pcall(require, plugin_name)
if not status then Schedudle_notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end


local actions = require('telescope.actions')

plugin.setup {
    defaults = {
        initial_mode = 'insert',
        file_ignore_patterns = {
            ".git",
            "__pycache__",
            "imgs",
            "fonts",
            "^build/",
            "^dependenscies/",
        },
        mappings = {
            i = {
                ["<C-j>"] = false, -- actions.move_selection_next,
                ["<C-k>"] = false, -- actions.move_selection_previous,
                ["<C-b>"] = false, -- actions.results_scrolling_up,
                ["<C-f>"] = false, -- actions.results_scrolling_down,
                ["<C-c>"] = false, -- actions.close,
                ["<Down>"] = false, -- actions.move_selection_next,
                ["<Up>"] = false, -- actions.move_selection_previous,
                ["<CR>"] = false, -- actions.select_default,
                ["<C-s>"] = false, -- actions.select_horizontal,
                ["<C-v>"] = false, -- actions.select_vertical,
                ["<C-t>"] = false, -- actions.select_tab,
                ["<c-d>"] = false, --require("telescope.actions").delete_buffer,
                ["<C-u>"] = false, -- actions.preview_scrolling_up,
                ["<C-d>"] = false, -- actions.preview_scrolling_down,
                ["<Tab>"] = false, -- actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = false, -- actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = false, --actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = false, --actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = false, --actions.complete_tag,
                ["<C-h>"] = false, --actions.which_key, -- keys from pressing <C-h>
            }, n = {
                ["<esc>"] = actions.close,
                -- ["q"] = actions.close,

                ["<CR>"] = actions.select_default,
                ["l"] = actions.select_default,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["ss"] = actions.select_horizontal,
                ["sv"] = actions.select_vertical,
                ["t"] = actions.select_tab,

                ["<C-x>"] = false, -- actions.select_horizontal,
                ["<C-v>"] = false, -- actions.select_vertical,
                ["<C-t>"] = false, -- actions.select_tab,
                ["<C-b>"] = false, -- actions.results_scrolling_up,
                ["<C-f>"] = false, -- actions.results_scrolling_down,
                ["<Tab>"] = false, -- actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = false, -- actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = false, -- actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = false, -- actions.send_selected_to_qflist + actions.open_qflist,
                ["H"] = false, -- actions.move_to_top,
                ["M"] = false, -- actions.move_to_middle,
                ["L"] = false, -- actions.move_to_bottom,
                ["dd"] = false, -- require("telescope.actions").delete_buffer,
                ["<Down>"] = false, -- actions.move_selection_next,
                ["<Up>"] = false, -- actions.move_selection_previous,
                ["<C-u>"] = false, -- actions.preview_scrolling_up,
                ["<C-d>"] = false, -- actions.preview_scrolling_down,
                ["<PageUp>"] = false, -- actions.results_scrolling_up,
                ["<PageDown>"] = false, -- actions.results_scrolling_down,
                ["?"] = false, -- actions.which_key,
            },
        },
    },
}
