local plugin_name = "lspsaga"
local status, plugin = pcall(require, plugin_name)
if not status then Schedudle_notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end


plugin.init_lsp_saga({
    border_style = "rounded", -- "single" | "double" | "rounded" | "bold" | "plus"
    saga_winblend = 0, -- window transparency
    move_in_saga = { prev = '<C-p>', next = '<C-n>' }, -- when cursor in saga window you config these to move

    diagnostic_header = { " ", " ", " ", " " },

    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 5,

    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = false,
    },

    -- finder icons
    finder_icons = {
        def = 'ﱆ ',
        ref = ' ',
        link = ' ',
    },

    finder_request_timeout = 5000,

    finder_action_keys = {
        open = { "<CR>", 'l' },
        split = "ss",
        vsplit = "sv",
        tabe = "t",
        quit = "<Esc>",
        scroll_down = "<Leader>j",
        scroll_up = "<Leader>k",
    },

    code_action_keys = {
        quit = '<ESC>',
        exec = "<CR>",
    },

    rename_action_quit = "<Esc>",
    rename_in_select = true,

    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },

    -- show outline
    show_outline = {
        win_position = 'right',
        win_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        auto_refresh = true,
    },
})
