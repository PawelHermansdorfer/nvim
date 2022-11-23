local plugin_name = "mason"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end


plugin.setup {
    ui = {
        border = 'rounded'
    }
}
