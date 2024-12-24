local base16 = require("colors")
-- this is comment
--- @type table<string, vim.api.keyset.highlight>
local M = {
	Normal = { fg = base16.base05, bg = base16.base00 },
	NormalNC = { fg = base16.base05, bg = base16.base00 },
	NormalFloat = { bg = base16.base00 },
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

	Comment = { fg = base16.base04, italic = true },
	Operator = { fg = base16.base05 },
	Identifier = { fg = base16.base05 },

	Delimiter = { fg = base16.base08 },
	Removed = { fg = base16.base08 },
	Constant = { fg = base16.base08, bold = true },

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

	["@lsp.typemod.variable.readonly"] = { link = "Constant" },
	["@lsp.typemod.parameter.readonly"] = { link = "Constant" },
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

	IblIndent = { fg = base16.base03 },
	IblScope = { fg = base16.base04 },

	StatusLine = { fg = base16.base05, bg = base16.base00, bold = true },
	StatusLineNC = { link = "StatusLine" },
	St_Normal = { link = "StatusLine" },
	St_Normal2 = { fg = base16.base04, bg = base16.base00, bold = true },

	CmpItemAbbr = { fg = base16.base05 },
	CmpItemAbbrDeprecated = { fg = base16.base04, strikethrough = true },
	CmpItemAbbrMatch = { fg = base16.base0D, bold = true },
	CmpItemKindConstant = { bg = base16.base08, fg = base16.base00, bold = true },
	CmpItemKindFunction = { bg = base16.base0D, fg = base16.base00, bold = true },
	CmpItemKindIdentifier = { bg = base16.base08, fg = base16.base00, bold = true },
	CmpItemKindField = { bg = base16.base08, fg = base16.base00, bold = true },
	CmpItemKindVariable = { bg = base16.base0E, fg = base16.base00, bold = true },
	CmpItemKindSnippet = { bg = base16.base08, fg = base16.base00, bold = true },
	CmpItemKindText = { bg = base16.base05, fg = base16.base00, bold = true },
	CmpItemKindStructure = { bg = base16.base0E, fg = base16.base00, bold = true },
	CmpItemKindType = { bg = base16.base0A, fg = base16.base00, bold = true },
	CmpItemKindKeyword = { bg = base16.base0E, fg = base16.base00, bold = true },
	CmpItemKindMethod = { bg = base16.base0D, fg = base16.base00, bold = true },
	CmpItemKindConstructor = { bg = base16.base0D, fg = base16.base00, bold = true },
	CmpItemKindFolder = { bg = base16.base0B, fg = base16.base00, bold = true },
	CmpItemKindModule = { bg = base16.base0A, fg = base16.base00, bold = true },
	CmpItemKindProperty = { bg = base16.base08, fg = base16.base00, bold = true },
	CmpItemKindEnum = { bg = base16.base0E, fg = base16.base00, bold = true },
	CmpItemKindUnit = { bg = base16.base0E, fg = base16.base00, bold = true },
	CmpItemKindClass = { bg = base16.base0A, fg = base16.base00, bold = true },
	CmpItemKindFile = { bg = base16.base0B, fg = base16.base00, bold = true },
	CmpItemKindInterface = { bg = base16.base0C, fg = base16.base00, bold = true },
	CmpItemKindColor = { bg = base16.base0C, fg = base16.base00, bold = true },
	CmpItemKindReference = { bg = base16.base05, fg = base16.base00, bold = true },
	CmpItemKindEnumMember = { bg = base16.base0E, fg = base16.base00, bold = true },
	CmpItemKindStruct = { bg = base16.base0E, fg = base16.base00, bold = true },
	CmpItemKindValue = { bg = base16.base0C, fg = base16.base00, bold = true },
	CmpItemKindEvent = { bg = base16.base0A, fg = base16.base00, bold = true },
	CmpItemKindOperator = { bg = base16.base05, fg = base16.base00, bold = true },
	CmpItemKindTypeParameter = { bg = base16.base08, fg = base16.base00, bold = true },
}

for key, value in pairs(M) do
	vim.api.nvim_set_hl(0, key, value)
end
