local plugin_name_cmp = "cmp"
local status_cmp, plugin_cmp = pcall(require, plugin_name_cmp)
if not status_cmp then vim.notify("Failed to load: " .. plugin_name_cmp, "error", { title = plugin_name_cmp }) return end

local plugin_name_lspkind = "lspkind"
local status_lspkind, plugin_lspkind = pcall(require, plugin_name_lspkind)
if not status_lspkind then vim.notify("Failed to load: " .. plugin_name_lspkind, "error", { title = plugin_name_lspkind }) return end

local cmp = plugin_cmp
local lspkind = plugin_lspkind

cmp.setup {
    mapping = cmp.mapping.preset.insert {
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        cmp.get_active_entry()

    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
    },
    experimental = {
        ghost_text = true,
    },
    window = {
        completion = {
            border = 'single',
            winhighlight = 'Normal:NormalFloat,Border:FloatBorder',
            scrollbar = false,
        },
        documentation = {
            border = 'single',
            winhighlight = 'Normal:NormalFloat,Border:FloatBorder',
            scrollbar = false,
        }
    },
    preselect = cmp.PreselectMode.None,
}
