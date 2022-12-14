local M = {}

M.packer = {
    "wbthomason/packer.nvim",
}

M.popup = {
    "nvim-lua/popup.nvim",
    after = "plenary.nvim"
}

M.plenary = {
    "nvim-lua/plenary.nvim",
}

M.web_devicons = {
    "kyazdani42/nvim-web-devicons",
    config = function()
        require "pawelek.plugins.configs.web_devicons"
    end
}

M.nvim_tree = {
    -- Custom icons used by other plugins
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require "pawelek.plugins.configs.nvim_tree"
    end,
    setup = function()
        require("pawelek.core").load_mappings "nvim_tree"
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
    config = function()
        require "pawelek.plugins.configs.auto_save"
    end
}

M.treesitter = {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    config = function()
        require "pawelek.plugins.configs.treesitter"
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
        require "pawelek.plugins.configs.autopairs"
    end
}

M.colorizer = {
    -- Display colors
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
        require "pawelek.plugins.configs.colorizer"
    end
}

M.bufferline = {
    -- Bufferline
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    event = "BufWinEnter",
    config = function()
        require "pawelek.plugins.configs.bufferline"
    end,
    setup = function()
        require("pawelek.core").load_mappings "bufferline"
    end
}

M.winbar = {
    -- Winbar
    "fgheng/winbar.nvim",
    config = function()
        require "pawelek.plugins.configs.winbar"
    end
}

M.lualine = {
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require "pawelek.plugins.configs.lualine"
    end
}

M.indent_blankline = {
    -- To display scope
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
        require "pawelek.plugins.configs.indent_blankline"
    end
}

M.telescope = {
    -- FZF
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
        require "pawelek.plugins.configs.telescope"
    end,
    setup = function()
        require("pawelek.core").load_mappings "telescope"
    end
}

M.nvim_comment = {
    -- Line comments
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
    config = function()
        require "pawelek.plugins.configs.nvim_comment"
    end,
    setup = function()
        require("pawelek.core").load_mappings "nvim_comment"
    end
}

M.ipy = {
    -- Jupyter qtconsole
    "bfredl/nvim-ipy",
    run = ":UpdateRemotePlugins",
    ft = "python",
    requires = {
        "jpalardy/vim-slime"
    },
    configa = function()
        vim.g.ipy_celldef = "# Cell"
    end,
    setup = function()
        require("pawelek.core").load_mappings "ipy"
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
        require "pawelek.plugins.configs.notify"
    end
}

M.fine_cmdline = {
    enabled = false,
    "VonHeikemen/fine-cmdline.nvim",
    cmd = "FineCmdline",
    requires = {
        { "MunifTanjim/nui.nvim" }
    },
    config = function()
        require "pawelek.plugins.configs.fine_cmdline"
    end,
}

M.noice = {
    "folke/noice.nvim",
    config = function()
        require "pawelek.plugins.configs.noice"
    end,
    requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}

-- =============== LSP ===============
M.mason = {
    -- Lsp manager | automaticly organizes servers
    "williamboman/mason.nvim",
    config = function()
        require "pawelek.plugins.configs.mason"
    end,
}

M.mason_lspconfig = {
    -- Connects lsp-congif with mason
    "williamboman/mason-lspconfig.nvim",
    after = "mason.nvim",
    config = function()
        require "pawelek.plugins.configs.mason_lspconfig"
    end,
    setup = function()
        require("pawelek.core").load_mappings "lspconfig"
    end
}

M.lspconfig = {
    -- Lsp
    "neovim/nvim-lspconfig",
    after = { "mason-lspconfig.nvim", "cmp-nvim-lsp" },
    config = function()
        require "pawelek.plugins.configs.lspconfig"
    end
}

M.lspsaga = {
    -- Better UI for lsp
    "glepnir/lspsaga.nvim",
    config = function()
        require "pawelek.plugins.configs.lspsaga"
    end,
    setup = function()
        require("pawelek.core").load_mappings "lspsaga"
    end
}

M.null_ls = {
    -- More servers, formaters etc.
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require "pawelek.plugins.configs.null_ls"
    end
}

M.lspkind = {
    "onsails/lspkind.nvim", -- Completion pictograms
    event = "BufRead",
    config = function()
        require "pawelek.plugins.configs.lspkind"
    end
}

-- =============== Completion ===============
M.nvim_cmp = {
    "hrsh7th/nvim-cmp",
    event  = { "BufNewFile", "BufRead", "InsertEnter" },
    config = function()
        require "pawelek.plugins.configs.cmp"
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
        require "pawelek.plugins.configs.lsp_signature"
    end
}

return M
