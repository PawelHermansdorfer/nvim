--             Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
--    Command        +------+-----+-----+-----+-----+-----+------+------+
-- !  [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- "" [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- c  c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- i  i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- n  n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- o  o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- s  s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- t  t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- v  v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x  x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- l  l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

local M = {}

M.general = {
    n = {
        [";"] = { ":" },
        ["<Space>"] = { "<Nop>" },

        ["ss"] = { "<CMD>split<RETURN>" }, -- horizontal split
        ["sv"] = { "<CMD>vsplit<RETURN>" }, -- vertical split
        ["sc"] = { "<CMD>q<CR>" }, -- close split

        -- Splits navigation
        ["<A-h>"] = { "<C-w>h" },
        ["<A-j>"] = { "<C-w>j" },
        ["<A-k>"] = { "<C-w>k" },
        ["<A-l>"] = { "<C-w>l" },

        -- Resize splits
        ["<A-K>"] = { "<CMD>resize +3<CR>" },
        ["<A-J>"] = { "<CMD>resize -3<CR>" },
        ["<A-H>"] = { "<CMD>vertical resize -3<CR>" },
        ["<A-L>"] = { "<CMD>vertical resize +3<CR>" },

        ["gt"] = { "<CMD>tabnew<CR>" }, -- Make new tab

        ["<LEADER>q"] = { "<CMD>bd<CR>" }, -- Close tab

        ["<LEADER>u"] = { "<CMD>set hlsearch!<CR>" }, -- Hide search highlight
        ["<LEADER>s"] = { "<CMD>set spell!<CR>" }, -- Hide search highlight

        ["<LEADER>a"] = { "ggVG" },

        ["S"] = { ":%s//g<Left><Left>" }, -- Replace shrtcut

        ["<Leader>r"] = { "<CMD>Run<CR>" },
        ["<Leader>b"] = { "<CMD>Build<CR>" },
        ["<Leader>bb"] = { "<CMD>BuildRun<CR>" },
    },
    x = {
        [";"] = { ":" },

        ["L"] = { ">gv" },
        ["H"] = { "<gv" },
        ["K"] = { "<ESC><CMD>move '<-2<CR>gv-gv" },
        ["J"] = { "<ESC><CMD>move '>+1<CR>gv-gv" },

        -- Sort lines
        ["<LEADER>s"] = { "<ESC><CMD>'<,'>sort<CR>" },

        -- Replace
        ["S"] = { ":s//g<Left><Left>" },
    }
}


M.telescope = {
    n = {
        ['sf'] = { "<cmd>Telescope find_files<CR>", "find files" }, -- show files
        ["sb"] = { "<cmd>Telescope buffers<CR>", "find buffers" }, -- show buffers
        ["sd"] = { "<cmd>Telescope diagnostics<CR>", "find buffers" }, -- show diagnostics
        ["<LEADER>g"] = { "<cmd>Telescope live_grep<CR>", "live grep" }, -- grep
        ["<LEADER>h"] = { "<cmd>Telescope help_tags<CR>", "help page" },
        ["<LEADER>w"] = { "<cmd>Telescope grep_string<CR>", "help page" },
    }
}


M.bufferline = {
    n = {
        -- Switch buffers
        ["L"] = { "<CMD>BufferLineCycleNext<CR>" },
        ["H"] = { "<CMD>BufferLineCyclePrev<CR>" },
    }
}


M.lspsaga = {
    n = {
        ["gd"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>" },
        ["gD"] = { "<CMD>Lspsaga lsp_finder<CR>" },
        ["<LEADER>d"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>" },
        ["K"] = { "<CMD>Lspsaga hover_doc<CR>" },
        ["R"] = { "<CMD>Lspsaga rename<CR>" },
        ["<LEADER>q"] = { "<CMD>Lspsaga code_action<CR>" },
    }
}

M.nvim_tree = {
    n = {
        ["<LEADER>f"] = { "<CMD>NvimTreeToggle<CR>" },
    }
}


M.lspconfig = {
    n = {
        ["<LEADER>F"] = { "<CMD>lua vim.lsp.buf.format()<CR>" },
    }
}


M.nvim_comment = {
    n = {
        ["<LEADER>c"] = { "<CMD>CommentToggle<CR>" },
        -- TODO/NOTE
        ["<LEADER>t"] = { "OTODO(Aa_Pawelek): <ESC><CMD>CommentToggle<CR> A" },
        ["<LEADER>y"] = { "ONOTE(Aa_Pawelek): <ESC><CMD>CommentToggle<CR> A" },
    },
    x = {
        ["<LEADER>c"] = { "<ESC><CMD>'<,'>CommentToggle<CR>" }
    }
}


M.ipy = {
    n = {
        ["<LEADER>rqt"] = { "<CMD>RunQtConsole<CR>" },
        ["<LEADER>rq"] = { "<CMD>IPython<Space>--existing<Space>--no-window<Enter><CR>" },
        ["<LEADER>rr"] = { "<Plug>(IPy-RunCell)" },
        ["<LEADER>ra"] = { "<Plug>(IPy-RunAll)" },
    }
}

return M
