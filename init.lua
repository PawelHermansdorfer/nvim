----------------------------------------------------------
-- NOTE(Aa_Pawelek): You have to install autopep8 and black manually
-- NOTE(Aa_Pawelek): Remember to install qt console
----------------------------------------------------------

-- TODO(Aa_Pawelek): Add toggleterm.nvim
-- TODO(Aa_Pawelek): Add vim-illuminate
-- TODO(Aa_Pawelek): Add nvim-dap
-- TODO(Aa_Pawelek): Get rid of mason-lspconfig

local status, impatient = pcall(require, "impatient")
if not status then vim.notify("Error loading impatient")
else impatient.enable_profile() end

require("core").setup()
require("plugins").setup()
