local plugin_name = "nvim-autopairs"
local status, plugin = pcall(require, plugin_name)
if not status then Schedudle_notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
