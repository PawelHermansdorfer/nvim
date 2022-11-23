local plugin_name = "nvim-web-devicons"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup {
    -- your personnal icons can go here (to override)
    -- DevIcon will be appended to `name`
    override = {
    },
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true
}
