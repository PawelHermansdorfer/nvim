local M = {}


M.packer = {
    "wbthomason/packer.nvim",
    event = "BufRead",
}

M.popup = {
    "nvim-lua/popup.nvim",
    after = "plenary.nvim"
}

M.plenary = {
    "nvim-lua/plenary.nvim",
    event = "BufRead"
}

M.web_devicons = {
    "kyazdani42/nvim-web-devicons",
    config = function()
        require "plugins.configs.web_devicons"
    end
}

M.nvim_tree = {
    -- Custom icons used by other plugins
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require "plugins.configs.nvim_tree"
    end,
    setup = function()
        require("core").load_mappings "nvim_tree"
    end
}

M.colorbuddy = {
    -- For colorschemes
    "tjdevries/colorbuddy.nvim",
    event = "VimEnter"
}

M.auto_save = {
    -- Auto save
    "Pocco81/auto-save.nvim",
    event = "BufRead",
    require = function()
        require "plugins.configs.auto_save"
    end
}

M.treesitter = {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    config = function()
        require "plugins.configs.treesitter"
    end

}

M.playground = {
    -- Better highlights
    "nvim-treesitter/playground",
    after = "nvim-treesitter",
    cmd = "TSHighlightCaptureUnderCursor",
}

M.autopairs = {
    -- Auto-closing parenthasis
    "windwp/nvim-autopairs",
    config = function()
        require "plugins.configs.autopairs"
    end
}

M.colorizer = {
    -- Display colors
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
        require "plugins.configs.colorizer"
    end
}

M.bufferline = {
    -- Bufferline
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require "plugins.configs.bufferline"
    end,
    setup = function()
        require("core").load_mappings "bufferline"
    end
}

M.winbar = {
    -- Winbar
    "fgheng/winbar.nvim",
    config = function()
        require "plugins.configs.winbar"
    end
}

M.lualine = {
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require "plugins.configs.lualine"
    end
}

M.indent_blankline = {
    -- To display scope
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
        require "plugins.configs.indent_blankline"
    end
}

M.telescope = {
    -- FZF
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
        require "plugins.configs.telescope"
    end,
    setup = function()
        require("core").load_mappings "telescope"
    end
}

M.kommentary = {
    -- Line comments
    "b3nj5m1n/kommentary",
    event = "BufRead",
    config = function()
        require "plugins.configs.kommentary"
    end,
    setup = function()
        require("core").load_mappings "kommentary"
    end
}


M.ipy = {
   -- Jupyter qtconsole
    "bfredl/nvim-ipy",
    run = ":UpdateRemotePlugin",
    ft = "python",
    configa = function()
        vim.g.ipy_celldef = '# Cell'
    end,
    setup = function()
        require("core").load_mappings "ipy"
    end
}

M.vim_startuptime = {
    -- Startup time
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
}

M.impatient = {
    "lewis6991/impatient.nvim"
}

M.notify = {
    "rcarriga/nvim-notify",
    config = function()
        --[[ require("notify").setup()
        vim.notify = require("notify") ]]
        require "plugins.configs.notify"
    end
}

-- =============== LSP ===============
M.mason = {
    -- Lsp manager | automaticly organizes servers
    "williamboman/mason.nvim",
    config = function()
        require "plugins.configs.mason"
    end,
}

M.mason_lspconfig = {
    -- Connects lsp-congif with mason
    "williamboman/mason-lspconfig.nvim",
    after = "mason.nvim",
    config = function()
        require "plugins.configs.mason_lspconfig"
    end,
    setup = function()
        require("core").load_mappings "lspconfig"
    end
}

M.lspconfig = {
    -- Lsp
    "neovim/nvim-lspconfig",
    after = { "mason-lspconfig.nvim", "cmp-nvim-lsp" },
    config = function()
        require "plugins.configs.lspconfig"
    end
}

M.lspsaga = {
    -- Better UI for lsp
    "glepnir/lspsaga.nvim",
    config = function()
        require "plugins.configs.lspsaga"
    end,
    setup = function()
        require("core").load_mappings "lspsaga"
    end
}

M.null_ls = {
    -- More servers, formaters etc.
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require "plugins.configs.null_ls"
    end
}

M.lspkind = {
    "onsails/lspkind.nvim", -- Completion pictograms
    event = "BufRead",
    config = function()
        require "plugins.configs.lspkind"
    end
}

-- =============== Completion ===============
M.nvim_cmp = {
    "hrsh7th/nvim-cmp",
    event  = { "BufNewFile", "BufRead", "InsertEnter" },
    config =function()
        require "plugins.configs.cmp"
    end
}

M.cmp_buffer = {
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
    after = "nvim-cmp"
}

M.cmp_path = {
    "hrsh7th/cmp-path",
    after = "nvim-cmp"
}

M.cmp_nvim_lsp = {
    "hrsh7th/cmp-nvim-lsp",
}

M.cmp_nvim_lua = {
    "hrsh7th/cmp-nvim-lua", -- nvim-cmp source for neovim"s built-in LSP
    after = "nvim-cmp"
}

M.lsp_signature = {
    -- Function signatures
    "ray-x/lsp_signature.nvim",
    -- event = "BufRead",
    after = "nvim-lspconfig",
    config = function()
        require "plugins.configs.lsp_signature"
    end
}


return M
