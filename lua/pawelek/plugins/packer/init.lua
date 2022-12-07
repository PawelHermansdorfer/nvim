local packer_init = require "pawelek.plugins.packer.packerInit"
local packer

if not packer_init then
    return
else
    packer = require "packer"
end

local use = packer.use

local status, pluginList = pcall(require, "pawelek.plugins.packer.pluginList")
if not status then
    Schedudle_notify("Error loading plugin list", "error", { title = "Plugin list" })
    return
end

for plugin, info in pairs(pluginList) do
    if info.enabled ~= false then
        use(info)
    end
end
