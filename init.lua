----------------------------------------------------------
-- NOTE(Aa_Pawelek): You have to install autopep8 manually
-- NOTE(Aa_Pawelek): Remember to install qt console
----------------------------------------------------------

-- Plugins
-- TODO(Aa_Pawelek): Add toggleterm.nvim
-- TODO(Aa_Pawelek): Add project.nvim nvim-bbye????
-- TODO(Aa_Pawelek): Add vim-illuminate
-- TODO(Aa_Pawelek): which key??
-- TODO(Aa_Pawelek): Add nvim-dap for debbugging
-- TODO(Aa_Pawelek): Make todo, note highlights
-- TODO(Aa_Pawelek): Telescope extensions???
-- TODO(Aa_Pawelek): https://github.com/LinArcX/telescope-command-palette.nvim
-- TODO(Aa_Pawelek): https://github.com/folke/noice.nvim
-- TODO(Aa_Pawelek): https://github.com/VonHeikemen/fine-cmdline.nvimS
-- TODO(Aa_Pawelek): https://github.com/j-hui/fidget.nvim   https://github.com/arkav/lualine-lsp-progress


-- Plugin replace
-- TODO(Aa_Pawelek): Replace kommentary with numToStr/comment.nvim
-- "terrortylor/nvim-comment",
-- cmd = "CommentToggle",

-- Mappings
-- TODO(Aa_Pawelek): <Leader>a to select all (as ctrl-a)
-- TODO(Aa_Pawelek): Remap ; to : and : to ;

-- Other
-- TODO(Aa_Pawelek): new formattings fucntion
-- TODO(Aa_Pawelek): Packer reinstallings itself
-- TODO(Aa_Pawelek): Null-ls (autopep8)
-- TODO(Aa_Pawelek): Lualine
-- TODO(Aa_Pawelek): Find word under cursor with telescope
-- TODO(Aa_Pawelek): Add after colorscheme to git repo, use with packer and require after and with collorbuddy


local status, impatient = pcall(require, "impatient")
if not status then vim.notify("Error loading impatient")
else impatient.enable_profile() end

require("core").setup()
require("plugins").setup()
