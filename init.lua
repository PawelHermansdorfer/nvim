----------------------------------------------------------
-- NOTE(Aa_Pawelek): You have to install autopep8 and black manually
-- NOTE(Aa_Pawelek): Remember to install qt console
----------------------------------------------------------

-- TODO(Aa_Pawelek): Add toggleterm.nvim
-- TODO(Aa_Pawelek): Add vim-illuminate
-- TODO(Aa_Pawelek): Add nvim-dap
-- TODO(Aa_Pawelek): Check out how lunarvim loads plugins
-- TODO(Aa_Pawelek): Change vim.notify to be schedudled
-- TODO(Aa_Pawelek): Get rid of mason-lspconfig


local core = require "pawelek.core"
local plugins = require "pawelek.plugins"
core.setup_utils()

local status, impatient = pcall(require, "impatient")
if not status then Schedudle_notify("Error loading impatient")
else impatient.enable_profile() end


core.setup()
plugins.setup()
