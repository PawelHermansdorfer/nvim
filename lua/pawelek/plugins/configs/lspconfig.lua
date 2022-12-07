local plugin_name = "lspconfig"
local status, plugin = pcall(require, plugin_name)
if not status then Schedudle_notify("Failed to load: " .. plugin_name, "error", { title = plugin_name }) return end
local nvim_lsp = plugin


require('lspconfig.ui.windows').default_options.border = 'rounded'

local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}


-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LUA --
nvim_lsp.sumneko_lua.setup {
    capabilities = capabilities,
    single_file_support = false,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
    },
}

-- PYTHON --
nvim_lsp.pyright.setup {
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern('main.py'),
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
            }
        }
    }
}

-- C/CPP --
nvim_lsp.clangd.setup {
    capabilities = capabilities,
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--all-scopes-completion',
        '--cross-file-rename',
        '--completion-style=detailed',
        '--header-insertion-decorators',
        '--header-insertion=iwyu',
        '--pch-storage=memory',
        '--enable-config',
        '--log=verbose'
    },
    root_dir = nvim_lsp.util.root_pattern(
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'build',
        'compile_flags.txt',
        'configure.ac',
        '.git'
    ),
    filetypes = { "c", "cpp", "objc", "objcpp" }
}

-- c#
nvim_lsp.omnisharp.setup {
    capabilities = capabilities,
    analyze_open_documents_only = false,
    enable_editorconfig_support = true,
    enable_import_completion = true,
    enable_ms_build_load_projects_on_demand = true,
    enable_roslyn_analyzers = true,
    filetypes = { "cs", "vb" },
    init_options = {},
    organize_imports_on_format = true,
}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = true,
    virtual_text = { spacing = 3, prefix = " ●" },
    severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = false,
    float = {
        source = "always", -- Or "if_many"
    },
})
