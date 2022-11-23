local plugin_name = "notify"
local status, plugin = pcall(require, plugin_name)
if not status then vim.notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end


--[[ highlight NotifyERRORBorder guifg=#8A1F1F
highlight NotifyWARNBorder guifg=#79491D
highlight NotifyINFOBorder guifg=#4F6752
highlight NotifyDEBUGBorder guifg=#8B8B8B
highlight NotifyTRACEBorder guifg=#4F3552
highlight NotifyERRORIcon guifg=#F70067
highlight NotifyWARNIcon guifg=#F79000
highlight NotifyINFOIcon guifg=#A9FF68
highlight NotifyDEBUGIcon guifg=#8B8B8B
highlight NotifyTRACEIcon guifg=#D484FF
highlight NotifyERRORTitle  guifg=#F70067
highlight NotifyWARNTitle guifg=#F79000
highlight NotifyINFOTitle guifg=#A9FF68
highlight NotifyDEBUGTitle  guifg=#8B8B8B
highlight NotifyTRACETitle  guifg=#D484FF
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal ]]


vim.notify = plugin
plugin.setup({
    background_colour = "#000000",
    render = "default" -- "default", "simple", "minimal"
})

local function configure_progress_notifs()
    local notify = require("plugins.utils.notify_spinner")
    local spinners = {}

    vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("LspNotify", { clear = true }),
        pattern = "LspProgressUpdate",
        desc = "LSP progress notifications",
        callback = function()
            for _, c in pairs(vim.lsp.get_active_clients()) do
                for token, ctx in pairs(c.messages.progress) do
                    if not spinners[c.id] then
                        spinners[c.id] = {}
                    end
                    local s = spinners[c.id][token]
                    if not ctx.done then
                        if not s then
                            local msg = notify.format_message(ctx.message, ctx.percentage)
                            local opts = { title = notify.format_title(ctx.title, c.name) }
                            spinners[c.id][token] = notify.Spinner(msg, vim.log.levels.INFO, opts)
                        else
                            s:update(notify.format_message(ctx.message, ctx.percentage))
                        end
                    else
                        c.messages.progress[token] = nil
                        if s then
                            s:done(ctx.message or "Complete", nil, { icon = "" })
                            spinners[c.id][token] = nil
                        end
                    end
                end
            end
        end,
    })
end

--[[ vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    end
  end,
}) ]]
configure_progress_notifs()
