local plugin_name = "nvim-treesitter.configs"
local status, plugin = pcall(require, plugin_name)
if not status then Schedudle_notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup {
    auto_install = true,

    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false, -- Doesn't seem to work
        disable = {},
    },
    ensure_installed = {
        "lua",
        "python",
        "json",
        "c",
        "cpp",
    },
    ignore_installed = {},
    ignore_install = {},
    autotag = {
        enable = true,
    },
}
