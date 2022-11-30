local plugin_name = "fine-cmdline"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end


plugin.setup {
    cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = ':'
    },
    popup = {
        position = {
            row = '10%',
            col = '50%',
        },
        size = {
            width = '60%',
        },
        border = {
            style = 'rounded',
        },
        win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
        }
    },
}
