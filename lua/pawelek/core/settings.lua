local opt = vim.opt
local g = vim.g
local fn = vim.fn


vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.mouse = "a" -- allow the mouse to be used in neovim
g.mapleader = " "
g.maplocalleader = " "

opt.number = true
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- default 4
opt.cursorline = true
opt.signcolumn = "yes:1" -- "no" -- always show the sign column, otherwise it would shift the text each time

opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.smarttab = false
opt.breakindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.title = true
opt.wrap = false -- No Wrap lines
opt.showmode = false -- See things like -- INSERT --
opt.showtabline = 2 -- always show tabs
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.laststatus = 3 -- global statusline
opt.showcmd = true
opt.cmdheight = 1 -- height of command line

opt.backup = false
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.undofile = true -- enable persistent undo
opt.swapfile = false -- creates a swapfile

opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.inccommand = "split"
opt.path:append { "**" } -- Finding files - Search down into subfolders
opt.wildignore:append { "*/node_modules/*" }
opt.smartcase = true -- smart case

opt.list = false -- shows spaces and tabs
opt.listchars:append "trail:×"
opt.whichwrap:append "<>[]hl"

opt.backspace = { "start", "eol", "indent" }
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)

opt.lazyredraw = false
opt.updatetime = 300 -- faster completion (4000ms default)
opt.wildoptions = 'pum'
opt.winblend = 0
opt.pumblend = 0
opt.pumheight = 10 -- pop up menu height

-- disable tilde on end of buffer:
vim.cmd("let &fcs='eob: '")

-- shortmess options
opt.shortmess:append("asI") --disable intro


-- Set termguicolors
if fn.has("termguicolors") then
    opt.termguicolors = true
end
g.t_Co = "256"
opt.background = 'dark'
opt.guifont = { "JetBrains Mono", ":h11" }

-- Disable autocommenting
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function()
        opt.formatoptions = ""
    end
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste"
})

if vim.fn.has "win32" then
    g.clipboard =  {
        cache_enabled = 0,
        copy = {
            ["*"] = "win32yank.exe -i --crlf",
            ["+"] = "win32yank.exe -i --crlf"
        },
        name = "win32yank",
        paste = {
            ["*"] = "win32yank.exe -o --lf",
            ["+"] = "win32yank.exe -o --lf"
        }
    }
    opt.clipboard:prepend { "unnamed", "unnamedplus" }
    opt.shell = "cmd"
elseif vim.fn.has "macunix" then
    g.clipboard = {
        cache_enabled = 0,
        copy = {
            ["*"] = "pbcopy",
            ["+"] = "pbcopy"
        },
        name = "win32yank",
        paste = {
            ["*"] = "pbpaste",
            ["+"] = "pbpaste"
        }
    }
    opt.clipboard:append { "unnamedplus" }
    opt.shell = "fish"
else
    Schedudle_notify("Shell for " .. vim.loop.os_uname().system .. " not set")
end

-- Disable unnecessary stuff
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- Neovide
if g.neovide ~= nil then
    -- g.neovide_refresh_rate = 60
    -- g.neovide_refresh_rate_idle = 60 -- refresh rate of the app when it is not in focus
    g.neovide_transparency = 0.2
    -- g.neovide_floating_blur_amount_x = 10.0
    -- g.neovide_floating_blur_amount_y = 10.0
    -- g.neovide_fullscreen = false
    -- g.neovide_underline_automatic_scaling = true
    -- g.neovide_input_use_logo = true
    g.airline_powerline_fonts = 1
    g.neovide_cursor_antialiasing = true
    g.neovide_no_idle = true
    g.neovide_cursor_animation_length = 0.13
    g.neovide_cursor_vfx_particle_density = 10.0
    g.neovide_hide_mouse_when_typing = true
    g.neovide_confirm_quit = true
end

-- IPython
g.ipy_celldef = '# Cell'
