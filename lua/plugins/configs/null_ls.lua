local plugin_name = "null-ls"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup({
    sources = {
        plugin.builtins.formatting.autopep8.with({ extra_args = { '--aggressive', '--aggressiv' } }),
    },
    update_in_insert = false,
})
