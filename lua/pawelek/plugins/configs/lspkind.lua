local plugin_name = "lspkind"
local status, plugin = pcall(require, plugin_name)
if not status then Schedudle_notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end


plugin.init({
    mode = 'symbol_text', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'

    preset = 'default', -- ;codicons

    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
    },
})
