-- Iterm
-- #000000 -- BG // Black
-- #E4F0E4 -- FG // White // Selection text
-- #24303C -- Selection bg
-- #484854 -- blue
-- #6C7878 -- Cyan
-- #606C6C -- Magenta
-- #849C9C -- Green
-- #A8A8A8 -- Yellow

-- Neovim
-- #000000 -- b1
-- #182430 -- b2
-- #24303C -- b3
-- #303C48 -- b4
-- #E4F0E4 -- fg1 
-- #C0CCC0 -- fg2
-- #A8A8A8 -- fg3
-- #6C7878 -- fg4
-- #484854 -- ex1
-- #606C6C -- ex2
-- #849C9C -- ex3


local M = {}

function M.setup(opts)
    vim.cmd [[ packadd! colorbuddy.nvim ]]
    vim.g.colors_name = "darkwood"

    local plugin_name = "colorbuddy"
    local status, plugin = pcall(require, plugin_name)
    if not status then vim.notify("Cannot load colorscheme, colorbuddy is not installed") return end
    local Color, colors, Group, groups, styles = plugin.setup()

    Color.new("bg1",         "#000000")
    Color.new("bg2",         "#182430")
    Color.new("bg3",         "#24303C")
    Color.new("bg4",         "#303C48")

    Color.new("fg1",        "#E4F0E4")
    Color.new("fg2",        "#C0CCC0")
    Color.new("fg3",        "#A8A8A8")
    Color.new("fg4",        "#6C7878")

    Color.new("ex1",        "#484854")
    Color.new("ex2",        "#606C6C")
    Color.new("ex3",        "#849C9C")

    Color.new("info",       "#E4F0E4")
    Color.new("warning",    "#f2b000" )
    Color.new("error",      "#e74c3c")


    --        --NAME--          --FG--              --BG--              --STYLE--
    Group.new("Title",          colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("Special",        colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("MatchParen",     colors.NONE,        colors.fg3,         styles.NONE) -- matching parenm
    Group.new("NonText ",       colors.NONE,        colors.NONE,        styles.NONE)
    Group.new("Underlined",     colors.NONE,        colors.NONE,        styles.NONE)
    Group.new("TODO",           colors.NONE,        colors.NONE,        styles.NONE)
    Group.new("SpecialKey",     colors.NONE,        colors.NONE,        styles.NONE)
    Group.new("Ignore",         colors.NONE,        colors.NONE,        styles.NONE)
    Group.new("Question",       colors.NONE,        colors.NONE,        styles.NONE)
    Group.new("FoldColumn",     colors.NONE,        colors.NONE,        styles.NONE)
    Group.new("Conceal",        colors.NONE,        colors.NONE,        styles.NONE)
    Group.new("ColorColumn",    colors.NONE,        colors.bg2,         styles.NONE) -- ruler
    Group.new("luaparenerror",  colors.fg1,         colors.NONE,        styles.NONE)

    -- Normal
    Group.new("Normal",         colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("NormalNC",       colors.fg1,         colors.NONE,        styles.NONE) -- Normal non current

    -- Cursor
    Group.new("Cursor",         colors.bg1,         colors.fg1,          styles.reverse) -- It its handled by terminal emulator
    Group.new("Visual",         colors.fg1,         colors.bg3,          styles.NONE)
    Group.new("VisualNOS",      colors.fg1,         colors.bg3,          styles.NONE)
    Group.new("CursorLine",     colors.NONE,        colors.bg2,          styles.NONE, colors.fg1)

    Group.new("LineNr",         colors.ex3,         colors.NONE,        styles.NONE)
    Group.new("CursorLineNr",   colors.fg1,         colors.NONE,         styles.NONE,  colors.fg1)


    Group.new("SignColumn",     colors.fg2,         colors.NONE,        styles.NONE)
    Group.new("StatusLine",     colors.bg2,         colors.bg2,         styles.NONE)
    Group.new("StatusLineNC",   colors.bg2,         colors.bg4,         styles.NONE)
    Group.new("VertSplit",      colors.ex3,         colors.NONE,        styles.NONE)

    Group.new("IncSearch",      colors.fg1,         colors.warning:dark(), styles.NONE)
    Group.new("Search",         colors.fg1,         colors.warning,        styles.NONE)

    Group.new("DiffText",       colors.info,        colors.NONE,        styles.bold)
    Group.new("DiffAdd",        colors.info,        colors.NONE,        styles.bold)
    Group.new("DiffChange",     colors.warning,     colors.NONE,        styles.bold)
    Group.new("DiffDelete",     colors.error,       colors.NONE,        styles.bold)

    Group.new("MoreMsg",        colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("ModeMsg",        colors.fg1,         colors.NONE,        styles.NONE)

    Group.new("WarningMsg",     colors.warning,     colors.NONE,        styles.NONE)
    Group.new("ErrorMsg ",      colors.error,       colors.NONE,        styles.NONE)
    Group.new("Error",          colors.error,       colors.NONE,        styles.NONE)

    Group.new("SpellBad",       colors.error,       colors.NONE,        styles.undercurl)
    Group.new("SpellCap",       colors.warning,     colors.NONE,        styles.undercurl)
    Group.new("SpellRare",      colors.info,        colors.NONE,        styles.undercurl)
    Group.new("SpellLocal",     colors.info,        colors.NONE,        styles.undercurl)

    -- popup menu
    Group.new("Pmenu",          colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("PmenuSel",       colors.fg1,         colors.bg3,         styles.NONE) -- selected item
    Group.new("PmenuSbar",      colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("PmenuThumb",     colors.fg1,         colors.NONE,        styles.NONE)

    -- Floating window
    Group.new("NormalFloat",    colors.fg1,         colors.NONE,        styles.NONE,    colors.NONE,    0) -- popup menu normal item
    Group.new("FloatBorder",    colors.fg1,         colors.NONE,        styles.NONE,    colors.NONE,    0) -- popup menu normal item

    -- Wildmenu
    Group.new("Directory",      colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("Folded",         colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("WildMenu",       colors.fg1,         colors.NONE,        styles.NONE)

    -- Constants
    Group.new("const",          colors.ex3,         colors.NONE,        styles.NONE)
    Group.new("Constant",       groups.const)
    Group.new("Number",         groups.const)
    Group.new("Boolean",        groups.const)
    Group.new("Chareacter",     groups.const)
    Group.new("Float",          groups.const)

    -- Keywords
    Group.new("keyword",        colors.fg2,         colors.NONE,        styles.NONE)
    Group.new("Keyword",        groups.keyword)
    Group.new("Tag",            groups.keyword)
    Group.new("Statement",      groups.keyword)
    Group.new("Operator",       groups.keyword)
    Group.new("PreProc",        groups.keyword)
    Group.new("Conditional",    groups.keyword)
    Group.new("Define",         groups.keyword)

    -- Var
    Group.new("var",            colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("Label",              groups.var)
    Group.new("variable",           groups.var)

    -- Func
    Group.new("func",           colors.fg1,         colors.NONE,        styles.NONE)
    Group.new("@Function",          groups.func)
    Group.new("@Function.builtin",  groups.func)
    Group.new("@Function.call",     groups.func)


    -- Type
    Group.new("type",           colors.ex3,         colors.NONE,        styles.NONE)
    Group.new("Type",           groups.type)
    Group.new("Identifier",     groups.type)
    Group.new("StorageClass",   groups.type)

    -- Str
    Group.new("str",            colors.fg3,         colors.NONE,        styles.NONE)
    Group.new("String",         groups.str)

    -- Comments
    Group.new("comment",        colors.ex2,         colors.NONE,        styles.NONE)
    Group.new("Comment",        groups.comment)


    -- ---------- Language specific
    -- Ruby Highlighting
    Group.new("rubyAttribute",              groups.func)
    Group.new("rubyLocalVariableOrMethod",  groups.var)
    Group.new("rubyGlobalVariable",         groups.var)
    Group.new("rubyInstanceVariable",       groups.var)
    Group.new("rubyKeyword",                groups.keyword)
    Group.new("rubyKeywordAsMethod",        groups.keyword)
    Group.new("rubyClassDeclaration",       groups.keyword)
    Group.new("rubyClass",                  groups.keyword)
    Group.new("rubyNumber",                 groups.const)

    -- Python Highlighting
    Group.new("pythonBuiltinFunc",          groups.func)

    -- Go Highlighting
    Group.new("goBuiltins",                 groups.func)

    -- Javascript Highlighting
    Group.new("jsBuiltins",                 groups.func)
    Group.new("jsFunction",                 groups.keyword)
    Group.new("jsGlobalObjects",            groups.type)
    Group.new("jsAssignmentExps",           groups.var)

    -- Html Highlighting
    Group.new("htmlLink",                   groups.var)
    Group.new("htmlStatement",              groups.keyword)
    Group.new("htmlSpecialTagName",         groups.keyword)

    -- Markdown Highlighting
    Group.new("mkdCode",                    groups.func)

    -- ---------- Other
    Group.new("CmpItemAbbr",                colors.fg1,         colors.NONE, styles.NONE) -- Unmatched characters
    Group.new("CmpItemAbbrDeprecated",      colors.fg1,         colors.NONE, styles.NONE)
    Group.new("CmpItemAbbrMatch",           colors.warning,     colors.NONE, styles.NONE) -- Matched characters
    Group.new("CmpItemAbbrMatchFuzzy",      colors.warning,     colors.NONE, styles.NONE)
    Group.new("CmpItemKind",                colors.fg1,         colors.NONE, styles.NONE)

    Group.new("LspSignatureActiveParameter",    colors.fg1,         colors.bg3,        styles.NONE) -- selected item


    Group.new("IndentBlanklineChar",            colors.bg3,     colors.NONE,    styles.NONE)
    Group.new("IndentBlanklineContextChar",     colors.bg3,     colors.NONE,    styles.NONE)
    Group.new("IndentBlanklineContextStart",    colors.bg3,     colors.NONE,    styles.NONE)

    Group.new("LspInfoBorder",  groups.FloatBorder)
    Group.new("packerWorking",  groups.FloatBorder)

    Group.new("LspSagaCodeActionTitle",         colors.fg1)
    Group.new("LspSagaBorderTitle",             colors.fg1, colors.NONE, styles.NONE)
    Group.new("LspSagaDiagnosticHeader",        colors.fg1)
    Group.new("LspSagaFinderSelection",         colors.fg1)
    Group.new("SagaShadow",                     colors.fg1)
    Group.new("ProviderTruncateLine",           colors.fg1)
    Group.new("LspSagaShTruncateLine",          groups.ProviderTruncateLine)
    Group.new("LspSagaDocTruncateLine",         groups.ProviderTruncateLine)
    Group.new("LspSagaCodeActionTruncateLine",  groups.ProviderTruncateLine)
    Group.new("LspSagaHoverBorder",             colors.fg1, colors.NONE, styles.NONE)
    Group.new("LspSagaRenameBorder",            groups.LspSagaHoverBorder)
    Group.new("LspSagaDiagnosticBorder",        groups.LspSagaHoverBorder)
    Group.new("LspSagaSignatureHelpBorder",     groups.LspSagaHoverBorder)
    Group.new("LspSagaCodeActionBorder",        groups.LspSagaHoverBorder)
    Group.new("LspSagaLspFinderBorder",         groups.LspSagaHoverBorder)
    Group.new("LspSagaFloatWinBorder",          groups.LspSagaHoverBorder)
    Group.new("LspSagaSignatureHelpBorder",     groups.LspSagaHoverBorder)
    Group.new("LspSagaDefPreviewBorder",        groups.LspSagaHoverBorder)
    Group.new("LspSagaAutoPreviewBorder",       groups.LspSagaHoverBorder)
    Group.new("LspFloatWinBorder",              groups.LspSagaHoverBorder)
    Group.new("LspLinesDiagBorder",             groups.LspSagaHoverBorder)
    Group.new("DefinitionBorder",               groups.LspSagaHoverBorder)
    Group.new("LspOutlinePreviewBorder",        groups.LspSagaHoverBorder)
    Group.new("LspSagaAutoPreview",             groups.LspSagaHoverBorder)
    Group.new("FinderSpinnerBorder",            groups.LspSagaHoverBorder)

    Group.new("FinderParam",                    colors.fg1)
    Group.new("TargetFileName",                 colors.fg1)

    Group.new("DiagnosticQuickFix", colors.fg1)
    Group.new("DiagnosticMap", colors.fg1)

    Group.new("FinderSpinnerTitle",             colors.fg1)
    Group.new("finderspinner",                  colors.ex3)

    Group.new("Definitions",                    colors.ex3)
    Group.new("DefinitionsIcon",                colors.ex3)
    Group.new("DefinitionsCount",               colors.ex3)
    Group.new("References",                     colors.ex3)
    Group.new("ReferencesIcon",                 colors.ex3)
    Group.new("ReferencesCount",                colors.ex3)
    Group.new("Implements",                     colors.ex3)
    Group.new("ImplementsIcon",                 colors.ex3)
    Group.new("ImplementsCount",                colors.ex3)

    Group.new("FinderVirtText",     colors.fg1)

    Group.new("DiagnosticError", colors.error, colors.NONE, styles.NONE)
    Group.new("DiagnosticVirtualTextError", colors.error, colors.NONE, styles.NONE)
    Group.new("DiagnosticUnderlineError", colors.NONE, colors.NONE, styles.undercurl, colors.error)

    Group.new("DiagnosticWarn", colors.warning, colors.NONE, styles.NONE)
    Group.new("DiagnosticVirtualTextWarn", colors.warning, colors.NONE, styles.NONE)
    Group.new("DiagnosticUnderlineWarn", colors.NONE, colors.NONE, styles.undercurl, colors.warning)

    Group.new("DiagnosticInfo", colors.info, colors.NONE, styles.NONE)
    Group.new("DiagnosticVirtualTextInfo", colors.info, colors.NONE, styles.NONE)
    Group.new("DiagnosticUnderlineInfo", colors.NONE, colors.NONE, styles.undercurl, colors.info)

    Group.new("DiagnosticHint", colors.info, colors.NONE, styles.NONE)
    Group.new("DiagnosticVirtualTextHint", colors.info, colors.NONE, styles.NONE)
    Group.new("DiagnosticUnderlineHint", colors.NONE, colors.NONE, styles.undercurl, colors.info)
    return M
end

return M
