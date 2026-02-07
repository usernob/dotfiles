local c = require("colors")

-- Reset highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.termguicolors = true

--- @type {[string]: vim.api.keyset.highlight}
local highlights = {
    -- Editor
    Normal = { fg = c.base05, bg = c.base00 },
    NormalFloat = { fg = c.base05, bg = c.base01 },
    NormalNC = { fg = c.base05, bg = c.base00 },
    NonText = { fg = c.base03 },

    -- Cursor
    Cursor = { fg = c.base00, bg = c.base05, bold = true },
    CursorLine = { bg = c.base01 },
    CursorColumn = { bg = c.base01 },
    CursorLineNr = { fg = c.base0A, bg = c.base01 },

    -- Line Numbers
    LineNr = { fg = c.base03 },
    SignColumn = { fg = c.base03, bg = c.base00 },
    CursorLineFold = { bg = c.base01 },
    CursorLineSign = { bg = c.base01 },

    -- Selection
    Visual = { bg = c.base02 },
    VisualNOS = { bg = c.base02 },

    -- Search
    Search = { fg = c.base00, bg = c.base0A },
    IncSearch = { fg = c.base00, bg = c.base09 },

    -- Status Line
    StatusLine = { fg = c.base05, bg = c.base01 },
    StatusLineNC = { fg = c.base04, bg = c.base01 },

    -- Tab Line
    TabLine = { fg = c.base04, bg = c.base01 },
    TabLineFill = { bg = c.base01 },
    TabLineSel = { fg = c.base05, bg = c.base02 },

    -- Popup Menu
    Pmenu = { fg = c.base05, bg = c.base01 },
    PmenuSel = { fg = c.base00, bg = c.base0D },
    PmenuSbar = { bg = c.base02 },
    PmenuThumb = { bg = c.base04 },
    PmenuMatch = { fg = c.base08 },

    -- Splits
    VertSplit = { fg = c.base02 },
    WinSeparator = { fg = c.base02 },

    -- Diff
    DiffAdd = { fg = c.base0B, bg = c.base01 },
    DiffChange = { fg = c.base0A, bg = c.base01 },
    DiffDelete = { fg = c.base08, bg = c.base01 },
    DiffText = { fg = c.base0D, bg = c.base01 },

    -- Folding
    Folded = { fg = c.base04, bg = c.base01 },
    FoldColumn = { fg = c.base04, bg = c.base00 },

    -- Messages
    OkMsg = { fg = c.base09 },
    ErrorMsg = { fg = c.base08 },
    WarningMsg = { fg = c.base09 },
    ModeMsg = { fg = c.base0B },
    MoreMsg = { fg = c.base0C },
    Question = { fg = c.base0D },

    Directory = { fg = c.base0C },
    ColorColumn = { bg = c.base01 },

    -- Syntax Groups
    Comment = { fg = c.base04, italic = true },

    Constant = { fg = c.base09 },
    String = { fg = c.base0B },
    Character = { fg = c.base08 },
    Number = { fg = c.base09 },
    Boolean = { fg = c.base09 },
    Float = { fg = c.base09 },

    Identifier = { fg = c.base08 },
    Function = { fg = c.base0D },

    Statement = { fg = c.base0E },
    Conditional = { fg = c.base0E },
    Repeat = { fg = c.base0E },
    Label = { fg = c.base0E },
    Operator = { fg = c.base05 },
    Keyword = { fg = c.base0E },
    Exception = { fg = c.base0E },

    PreProc = { fg = c.base0A },
    Include = { fg = c.base0D },
    Define = { fg = c.base0E },
    Macro = { fg = c.base08 },
    PreCondit = { fg = c.base0A },

    Type = { fg = c.base0A },
    StorageClass = { fg = c.base0A },
    Structure = { fg = c.base0E },
    Typedef = { fg = c.base0A },

    Special = { fg = c.base0C },
    SpecialChar = { fg = c.base0F },
    Tag = { fg = c.base0A },
    Delimiter = { fg = c.base0F },
    SpecialComment = { fg = c.base0C },
    Debug = { fg = c.base08 },

    Underlined = { fg = c.base0D, underline = true },
    Ignore = { fg = c.base03 },
    Error = { fg = c.base08, bg = c.base01 },
    Todo = { fg = c.base0A, bg = c.base01 },

    -- Treesitter
    ["@variable"] = { fg = c.base05 },
    ["@variable.builtin"] = { fg = c.base09 },
    ["@variable.parameter"] = { fg = c.base08 },
    ["@variable.member"] = { fg = c.base08 },

    ["@constant"] = { fg = c.base09 },
    ["@constant.builtin"] = { fg = c.base09 },
    ["@constant.macro"] = { fg = c.base08 },

    ["@string"] = { fg = c.base0B },
    ["@string.escape"] = { fg = c.base0C },
    ["@string.special"] = { fg = c.base0F },

    ["@character"] = { fg = c.base08 },
    ["@number"] = { fg = c.base09 },
    ["@boolean"] = { fg = c.base09 },
    ["@float"] = { fg = c.base09 },

    ["@function"] = { fg = c.base0D },
    ["@function.builtin"] = { fg = c.base0D },
    ["@function.macro"] = { fg = c.base08 },
    ["@function.method"] = { fg = c.base0D },

    ["@constructor"] = { fg = c.base0A },
    ["@operator"] = { fg = c.base05 },
    ["@keyword"] = { fg = c.base0E },
    ["@keyword.function"] = { fg = c.base0E },
    ["@keyword.operator"] = { fg = c.base0E },
    ["@keyword.return"] = { fg = c.base0E },

    ["@conditional"] = { fg = c.base0E },
    ["@repeat"] = { fg = c.base0E },
    ["@label"] = { fg = c.base0A },

    ["@type"] = { fg = c.base0A },
    ["@type.builtin"] = { fg = c.base0A },
    ["@type.qualifier"] = { fg = c.base0E },

    ["@property"] = { fg = c.base08 },
    ["@attribute"] = { fg = c.base0A },

    ["@tag"] = { fg = c.base0A },
    ["@tag.attribute"] = { fg = c.base08 },
    ["@tag.delimiter"] = { fg = c.base0F },

    -- LSP Semantic Tokens
    ["@lsp.type.class"] = { fg = c.base0A },
    ["@lsp.type.decorator"] = { fg = c.base0D },
    ["@lsp.type.enum"] = { fg = c.base0A },
    ["@lsp.type.enumMember"] = { fg = c.base09 },
    ["@lsp.type.function"] = { fg = c.base0D },
    ["@lsp.type.interface"] = { fg = c.base0A },
    ["@lsp.type.macro"] = { fg = c.base08 },
    ["@lsp.type.method"] = { fg = c.base0D },
    ["@lsp.type.namespace"] = { fg = c.base0A },
    ["@lsp.type.parameter"] = { fg = c.base08 },
    ["@lsp.type.property"] = { fg = c.base08 },
    ["@lsp.type.struct"] = { fg = c.base0A },
    ["@lsp.type.type"] = { fg = c.base0A },
    ["@lsp.type.variable"] = { fg = c.base05 },

    -- Diagnostics
    DiagnosticError = { fg = c.base08 },
    DiagnosticWarn = { fg = c.base0A },
    DiagnosticInfo = { fg = c.base0D },
    DiagnosticHint = { fg = c.base0C },

    DiagnosticUnderlineError = { undercurl = true, sp = c.base08 },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.base0A },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.base0D },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.base0C },

    -- Git Signs
    GitSignsAdd = { fg = c.base0B },
    GitSignsChange = { fg = c.base0A },
    GitSignsDelete = { fg = c.base08 },

    IblIndent = { fg = c.base02 },
}

-- Apply highlights
for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
end
