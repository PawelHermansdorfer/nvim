local plugin_name = "mason-lspconfig"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end


local servers = { "sumneko_lua", "pyright", "omnisharp", "clangd" }
-- NOTE(Aa_Pawelek): Other packages that i have to install manually: autopep8, black

plugin.setup {
    ensure_installed = servers,
    automatic_installation = true
}
