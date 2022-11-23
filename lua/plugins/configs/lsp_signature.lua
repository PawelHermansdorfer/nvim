local plugin_name = "lsp_signature"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup {
    bind = false, -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false

    doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);

    max_height = 12,
    max_width = 80,
    wrap = true,

    floating_window = true,

    floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
    -- will set to true when fully tested, set to false will use whichever side has more space
    -- this setting will be helpful if you do not want the PUM and floating win overlap

    floating_window_off_x = -3, -- adjust float windows x position.
    floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

    close_timeout = 0, -- close floating window after ms when laster parameter is entered
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters

    hint_enable = false, -- virtual hint enable
    hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
    handler_opts = {
        border = "rounded" -- double, rounded, single, shadow, none
    },

    always_trigger = false,
    timer_interval = 50, -- default timer check interval set to lower value if you want to reduce latency
    move_cursor_key = '<C-k>', -- imap, use nvim_set_current_win to move cursor between current win and floating
}
