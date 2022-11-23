local plugin_name = "indent_blankline"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup {
    show_end_of_line = false,
    show_first_indent_level = true,
    space_char_blankline = ' ',
    show_trailing_blankline_indent = false,
    show_current_context = false,
    show_current_context_start = false,
    use_treesitter = false,
    use_treesitter_scope = false,
}
