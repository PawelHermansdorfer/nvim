----------------------------------------------------------
-- NOTE(Aa_Pawelek): You have to install autopep8 and black manually
-- NOTE(Aa_Pawelek): Remember to install qt console
----------------------------------------------------------

-- Plugins
-- TODO(Aa_Pawelek): Add toggleterm.nvim
-- TODO(Aa_Pawelek): Add project.nvim nvim-bbye????
-- TODO(Aa_Pawelek): Add vim-illuminate
-- TODO(Aa_Pawelek): Add nvim-dap for debbugging
-- TODO(Aa_Pawelek): Make todo, note highlights
-- TODO(Aa_Pawelek): https://github.com/LinArcX/telescope-command-palette.nvim
-- TODO(Aa_Pawelek): https://github.com/folke/noice.nvim
-- TODO(Aa_Pawelek): https://github.com/j-hui/fidget.nvim   
-- TODO(Aa_Pawelek): https://github.com/arkav/lualine-lsp-progress


-- Plugin replace
-- TODO(Aa_Pawelek): Get rid of mason-lspconfig

-- Other
-- TODO(Aa_Pawelek): Sumneko_lua loads worksapce each time i open lspsaga finder
-- TODO(Aa_Pawelek): Lualine


local status, impatient = pcall(require, "impatient")
if not status then vim.notify("Error loading impatient")
else impatient.enable_profile() end

require("core").setup()
require("plugins").setup()
