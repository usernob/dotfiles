local base16 = require("colors")

--- convert hex to r, g, b values
--- @param hex string
--- @return number?
--- @return number?
--- @return number?
local function hexToRGB(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)),
        tonumber("0x" .. hex:sub(3, 4)),
        tonumber("0x" .. hex:sub(5, 6))
end

--- convert r, g, b values to hex format
--- @param r integer
--- @param g integer
--- @param b integer
--- @return string
local function RGBToHex(r, g, b)
    return string.format("#%02X%02X%02X", r, g, b)
end

--- function to blending 2 color
--- @param step integer
--- @param color1 string
--- @param color2? string
local color_blend = function(step, color1, color2)
    if not color2 then
        color2 = base16.base00
    end
    local r1, g1, b1 = hexToRGB(color1)
    local r2, g2, b2 = hexToRGB(color2)
    local t = step / 100

    local r = r1 + (r2 - r1) * t
    local g = g1 + (g2 - g1) * t
    local b = b1 + (b2 - b1) * t

    return RGBToHex(math.floor(r), math.floor(g), math.floor(b))
end

-- this is comment
--- @type table<string, vim.api.keyset.highlight>
local M = {
    Normal = { fg = base16.base05, bg = base16.base00 },
    NormalNC = { fg = base16.base05, bg = base16.base00 },
    NormalFloat = { bg = base16.base00 },
    FloatBorder = { fg = base16.base04 },
    Pmenu = { bg = base16.base01 },
    PmenuSel = { bg = base16.base0D, fg = base16.base00, bold = true },
    WinSeparator = { fg = base16.base05 },
    Directory = { fg = base16.base0D },
    LineNr = { fg = base16.base03 },
    CursorLineNr = { fg = base16.base05 },
    CursorLine = { bg = base16.base01 },
    Title = { fg = base16.base0D },
    Visual = { bg = base16.base02 },

    ErrorMsg = { fg = base16.base08 },
    WarningMsg = { fg = base16.base0A },
    ModeMsg = { fg = base16.base0B },
    MoreMsg = { fg = base16.base0C },
    Question = { fg = base16.base0D },

    Comment = { fg = base16.base03, italic = true },
    Operator = { fg = base16.base05 },
    Identifier = { fg = base16.base05 },

    Delimiter = { fg = base16.base08 },
    Removed = { fg = base16.base08 },
    Constant = { fg = base16.base09, bold = true },

    Number = { fg = base16.base09 },
    Boolean = { fg = base16.base09 },

    Type = { fg = base16.base0A },
    StorageClass = { fg = base16.base0A },
    PreProc = { fg = base16.base0A },
    Label = { fg = base16.base0A },
    Changed = { fg = base16.base0A },

    String = { fg = base16.base0B },
    Character = { fg = base16.base0B },
    Added = { fg = base16.base0B },

    Special = { fg = base16.base0D },

    Function = { fg = base16.base0D },
    Include = { fg = base16.base0D },
    Define = { fg = base16.base0D },

    Keyword = { fg = base16.base0E },
    Statement = { fg = base16.base0E },
    Conditional = { fg = base16.base0E },
    Repeat = { fg = base16.base0E },

    ["@variable"] = { link = "Identifier" },
    ["@Variable.builtin"] = { fg = base16.base09 },
    ["@variable.parameter"] = { fg = base16.base08, italic = true },
    ["@variable.member"] = { fg = base16.base08 },

    ["@character.special"] = { fg = base16.base09 },

    ["@property"] = { link = "@variable.member" },

    ["@function.macro"] = { link = "Constant" },

    ["@keyword.import"] = { link = "Include" },

    ["@type.builtin"] = { link = "Type" },

    ["@string.escape"] = { fg = base16.base0C },

    -- ["@lsp.typemod.variable.readonly"] = { link = "Constant" },
    -- ["@lsp.typemod.parameter.readonly"] = { link = "Constant" },
    ["@lsp.mod.defaultLibrary"] = { italic = true },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.namespace"] = { link = "Constant" },
    ["@tag"] = { link = "Constant" },
    ["@tag.attribute"] = { link = "@property" },
    ["@tag.delimiter"] = { link = "Delimiter" },

    DiagnosticError = { fg = base16.base08 },
    DiagnosticWarn = { fg = base16.base0A },
    DiagnosticInfo = { fg = base16.base0B },
    DiagnosticHint = { fg = base16.base0E },

    ["@comment.todo"] = { link = "DiagnosticHint" },

    LspInlayHint = { link = "Comment" },
    LspSignatureActiveParameter = { bg = base16.base03 },

    IblIndent = { fg = base16.base02 },
    IblScope = { fg = base16.base03 },

    StatusLine = { fg = base16.base06, bg = base16.base00, bold = true },
    StatusLineNC = { link = "StatusLine" },
    St_Normal = { link = "StatusLine" },
    St_Normal2 = { fg = base16.base04, bold = true },

    DIffAdd = { fg = "NONE", bg = color_blend(70, base16.base0B) },
    DIffChange = { fg = "NONE", bg = color_blend(70, base16.base0A) },
    DIffDelete = { fg = "NONE", bg = color_blend(70, base16.base08) },
    DIffText = { fg = "NONE", bg = color_blend(60, base16.base0B) },
    DiffviewDiffAddAsDelete = { fg = base16.base02, bg = color_blend(70, base16.base08) },

    CmpItemAbbr = { fg = base16.base05 },
    CmpItemAbbrDeprecated = { fg = base16.base04, strikethrough = true },
    CmpItemAbbrMatch = { fg = base16.base0D, bold = true },
    CmpItemKindConstant = { fg = base16.base08, bold = true },
    CmpItemKindFunction = { fg = base16.base0D, bold = true },
    CmpItemKindIdentifier = { fg = base16.base08, bold = true },
    CmpItemKindField = { fg = base16.base08, bold = true },
    CmpItemKindVariable = { fg = base16.base0E, bold = true },
    CmpItemKindSnippet = { fg = base16.base08, bold = true },
    CmpItemKindText = { fg = base16.base05, bold = true },
    CmpItemKindStructure = { fg = base16.base0E, bold = true },
    CmpItemKindType = { fg = base16.base0A, bold = true },
    CmpItemKindKeyword = { fg = base16.base0E, bold = true },
    CmpItemKindMethod = { fg = base16.base0D, bold = true },
    CmpItemKindConstructor = { fg = base16.base0D, bold = true },
    CmpItemKindFolder = { fg = base16.base0B, bold = true },
    CmpItemKindModule = { fg = base16.base0A, bold = true },
    CmpItemKindProperty = { fg = base16.base08, bold = true },
    CmpItemKindEnum = { fg = base16.base0E, bold = true },
    CmpItemKindUnit = { fg = base16.base0E, bold = true },
    CmpItemKindClass = { fg = base16.base0A, bold = true },
    CmpItemKindFile = { fg = base16.base0B, bold = true },
    CmpItemKindInterface = { fg = base16.base0C, bold = true },
    CmpItemKindColor = { fg = base16.base0C, bold = true },
    CmpItemKindReference = { fg = base16.base05, bold = true },
    CmpItemKindEnumMember = { fg = base16.base0E, bold = true },
    CmpItemKindStruct = { fg = base16.base0E, bold = true },
    CmpItemKindValue = { fg = base16.base0C, bold = true },
    CmpItemKindEvent = { fg = base16.base0A, bold = true },
    CmpItemKindOperator = { fg = base16.base05, bold = true },
    CmpItemKindTypeParameter = { fg = base16.base08, bold = true },
}

for key, value in pairs(M) do
    vim.api.nvim_set_hl(0, key, value)
end
