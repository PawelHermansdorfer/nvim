local plugin_name = "auto-save"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup {
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    execution_message = {
        message = function() -- message to print on save
            -- return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
            return ""
        end,

        dim = 0.18, -- dim the color of `message`
        cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
    trigger_events = { "InsertLeave", "TextChanged" },
    write_all_buffers = true, -- write all buffers
    debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
}
