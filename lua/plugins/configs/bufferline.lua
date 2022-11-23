local plugin_name = "bufferline"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("failed to load: " .. plugin_name, "error", { title = plugin_name }) return end

plugin.setup {
    options = {
        mode = "tabs", -- tabs | buffers
        modified_icon = "●",

        separator_style = "slant", -- | "slant" | "padded_slant" | "thick" | "thin" | { "any", "any" },
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,

        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 25,
        enforce_regular_tabs = true,

        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_tab_indicators = false,
        color_icons = true,

        indicator = {
            icon = " ", -- this should be omitted if indicator style is not "icon"
            style = "none", --icon" | "underline" | "none",
        },
    },
    highlights = {
        separator = {
            fg = { attribute = "bg", highlight = "StatusLine" },
            bg = { attribute = "fg", highlight = "comment" },
        },
        separator_selected = {
            fg = { attribute = "fg", highlight = "StatusLine" },
            -- bg = { attribute = "bg", highlight = "StatusLine"}, -- Turn off for transparency
        },
        background = {
            fg = { attribute = "bg", highlight = "StatusLine" },
            bg = { attribute = "fg", highlight = "comment" },
        },
        buffer_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            -- bg = { attribute = "bg", highlight = "StatusLine"}, -- Turn off for transparency
            bold = true,
        },
        fill = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        modified = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "fg", highlight = "comment" },
        },
        modified_visible = {
            fg = "#f8f8f8",
            bg = { attribute = "fg", highlight = "comment" },
        },
        modified_selected = {
            fg = "#f8f8f8",
        },
    },
}
