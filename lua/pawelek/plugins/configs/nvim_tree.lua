local plugin1_name = "nvim-tree"
local status1, plugin1 = pcall(require, plugin1_name)
if not status1 then Schedudle_notify("Failed to load: " .. plugin1_name, "error", { title = plugin1_name }) return end

local plugin2_name = "nvim-tree.config"
local status2, plugin2 = pcall(require, plugin2_name)
if not status2 then Schedudle_notify("Failed to load: " .. plugin2_name, "error", { title = plugin2_name }) return end

local tree_cb = plugin2.nvim_tree_callback

plugin1.setup {
    hijack_netrw = true,
    hijack_cursor = false,
    disable_netrw = true,

    open_on_setup = false,
    open_on_tab = true,
    update_cwd = false,

    git = {
        enable = false;
    },

    actions = {
        open_file = {
            quit_on_open = true,
        }
    },

    renderer = {
        indent_markers = {
            enable = true,
        }
    },

    view = {
        float = {
            enable = true,
            quit_on_focus_loss = false,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 35,
                row = 1,
                col = 1,
            },
        },
        width = 30,
        hide_root_folder = true,
        side = 'left',
        mappings = {
            custom_only = true,
            list = {
                { key = { "l", "<CR>" }, cb = tree_cb "edit" },
                { key = "ss", cb = tree_cb "split" },
                { key = "sv", cb = tree_cb "vsplit" },
                { key = "t", cb = tree_cb "tabnew" },
                { key = "<Esc>", cb = tree_cb "close" },

                { key = "d", cb = tree_cb "remove" },
                { key = "r", cb = tree_cb "full_rename" },
                { key = "f", cb = tree_cb "create" },

                { key = "p", cb = tree_cb "paste" },
                { key = "y", cb = tree_cb "copy" },
                { key = "x", cb = tree_cb "cut" },
            },
        },
    }
}
