local plugin_name = "kommentary.config"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup({
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
})
