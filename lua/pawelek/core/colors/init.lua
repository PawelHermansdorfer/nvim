local M = {}

M.setup = function()
    if vim.g.colorscheme == nil then
        Schedudle_notify("Colorsceme not set\nUse vim.g.colorscheme fix it")
    elseif vim.g.colorscheme == "darkwood" then
        require "pawelek.core.colors.darkwood"
    elseif vim.g.colorscheme == "darkwood" then
        require "pawelek.core.colors.darkwood"
    else
        Schedudle_notify("Set incorrect colorscheme name")
    end
end

return M
