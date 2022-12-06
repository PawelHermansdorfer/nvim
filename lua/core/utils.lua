-- Print table
function Pprint(t)
    print(vim.inspect(t))
    return t
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.colorcolumn = { "80" }
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end
})


vim.api.nvim_create_user_command("RunQtConsole", function()
    local params = { "--JupyterWidget.include_other_output=True",
        "--JupyterWidget.syntax_style='stata-dark'"
    }
    local command = 'call jobstart("jupyter qtconsole '

    for _, param in pairs(params) do
        command = command .. param .. " "
    end
    command = command .. '")'
    vim.notify("Opening QtConsole.\nRemember to connect to created kernel and run :UpdateRemotePlugins", "info", { title = "Python QtConsole" })
    vim.api.nvim_command(command)
end, {})


local lang_maps
if vim.fn.has("win32") ~= 0 then -- Commands on Windows
    lang_maps = {
        c = { build = "pushd .\\build&&cmake --build .&&popd", run = "pushd .\\build\\ && main.exe && popd" }, -- cmake .. -G "MinGW Makefiles"
        python = { run = "python .\\main.py" },
    }
elseif vim.fn.has("macunix") ~= 0 then -- Commands on MacOS
    lang_maps = {
        c = { build = "./build.sh", run = "./build/main" },
        python = { run = "python ./main.py" },
    }
end

vim.api.nvim_create_user_command("Run", function()
    local data = lang_maps
    local lang = vim.bo.filetype
    if data[lang] ~= nil and data[lang] ~= nil then
        vim.api.nvim_command("split")
        vim.api.nvim_command("term " .. lang_maps[lang].run)
    else
        vim.notify("Run command not set for " .. lang, "error", { title = "Run" })
    end
end, {})
vim.api.nvim_create_user_command("Build", function()
    local data = lang_maps
    local lang = vim.bo.filetype
    if data[lang] ~= nil and data[lang].build ~= nil then
        vim.api.nvim_command("split")
        vim.api.nvim_command("term " .. lang_maps[lang].build)
    else
        vim.notify("Build command not set for " .. lang, "error", { title = "Build" })
    end
end, {})
vim.api.nvim_create_user_command("BuildRun", function()
    local data = lang_maps
    local lang = vim.bo.filetype
    if data[lang] ~= nil and data[lang].run ~= nil and data[lang].build ~= nil then
        vim.api.nvim_command("split")
        vim.api.nvim_command("term " .. lang_maps[lang].run .. "&&" .. lang_maps[lang].build)
    else
        vim.notify("Build and run commands not set for " .. lang, "error", { title = "Build and run" })
    end
end, {})
