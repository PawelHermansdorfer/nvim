----------------------------------------------------------
-- NOTE(Aa_Pawelek): You have to install autopep8 and black manually
-- NOTE(Aa_Pawelek): Remember to install qt console
----------------------------------------------------------


local core = require "pawelek.core"
local plugins = require "pawelek.plugins"
core.setup_utils()

local status, impatient = pcall(require, "impatient")
if not status then Schedudle_notify("Error loading impatient")
else impatient.enable_profile() end


core.setup()
plugins.setup()
