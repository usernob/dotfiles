-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

-- local base16 = require("base46").get_theme_tb "base_16"
-- local colors = require("base46").get_theme_tb "base_30"
local M = {}

---@type HLTable
M.override = {
	CursorLine = {
		bg = "black2",
	},
	CursorLineNr = {
		bg = "black2",
	},
	Comment = {
		italic = true,
	},
	["@comment"] = {
		italic = true,
	},
	FoldColumn = { fg = "grey_fg2", bg = "black" },
	NvimTreeOpenedFolderName = { fg = "green", bold = true },
	NvimTreeEndOfBuffer = { fg = "black" },
	NvimTreeNormalNC = { bg = "black" },
	NvimTreeNormal = { bg = "black" },
	NvimTreeWinSeparator = {
		fg = "black",
		bg = "black",
	},
	CodeiumSuggestion = { fg = "grey_fg2", italic = true },
	NavicIconsConstant = { fg = "orange" },
	NavicIconsFunction = { fg = "pmenu_bg" },
	NavicIconsField = { fg = "red" },
	NavicIconsVariable = { fg = "dark_purple" },
	NavicIconsKey = { fg = "white" },
	NavicIconsMethod = { fg = "pmenu_bg" },
	NavicIconsConstructor = { fg = "blue" },
	NavicIconsModule = { fg = "yellow" },
	NavicIconsProperty = { fg = "red" },
	NavicIconsEnum = { fg = "blue" },
	NavicIconsClass = { fg = "teal" },
	NavicIconsFile = { fg = "white" },
	NavicIconsInterface = { fg = "green" },
	NavicIconsEnumMember = { fg = "purple" },
	NavicIconsStruct = { fg = "dark_purple" },
	NavicIconsEvent = { fg = "yellow" },
	NavicIconsOperator = { fg = "light_grey" },
	NavicIconsTypeParameter = { fg = "red" },
	NavicIconsNull = { fg = "light_grey" },
	NavicIconsObject = { fg = "dark_purple" },
	NavicIconsArray = { fg = "cyan" },
	NavicIconsBoolean = { fg = "green" },
	NavicIconsNumber = { fg = "red" },
	NavicIconsString = { fg = "green" },
	NavicIconsPackage = { fg = "dark_purple" },
	NavicIconsNamespace = { fg = "orange" },
	NavicText = { fg = "white" },
	NavicSeparator = { fg = "#ffffff" },
}

---@type HLTable
M.add = {
	CodeiumSuggestion = { fg = "grey_fg2", italic = true },
	St_Codeium_bg = { bg = "vibrant_green", fg = "black" },
	St_Codeium_txt = { bg = "one_bg", fg = "vibrant_green" },
	St_Codeium_sep = { bg = "one_bg", fg = "vibrant_green" },
	-- CmpItemKindIdentifier = { fg = "red" },
	-- CmpItemKindSnippet = { fg = "red" },
	-- CmpItemKindText = { fg = "green" },
	-- CmpItemKindStructure = { fg = "dark_purple" },
	-- CmpItemKindType = { fg = ""yellow"w" },
	-- CmpItemKindFolder = { fg = "white" },
	-- CmpItemKindUnit = { fg = "dark_purple" },
	-- CmpItemKindColor = { fg = colors.white },
	-- CmpItemKindReference = { fg = "light_grey" },
	-- CmpItemKindValue = { fg = "cyan" },
	NavicIconsConstant = { fg = "orange" },
	NavicIconsFunction = { fg = "pmenu_bg" },
	NavicIconsField = { fg = "red" },
	NavicIconsVariable = { fg = "dark_purple" },
	NavicIconsKey = { fg = "white" },
	NavicIconsMethod = { fg = "pmenu_bg" },
	NavicIconsConstructor = { fg = "blue" },
	NavicIconsModule = { fg = "yellow" },
	NavicIconsProperty = { fg = "red" },
	NavicIconsEnum = { fg = "blue" },
	NavicIconsClass = { fg = "teal" },
	NavicIconsFile = { fg = "white" },
	NavicIconsInterface = { fg = "green" },
	NavicIconsEnumMember = { fg = "purple" },
	NavicIconsStruct = { fg = "dark_purple" },
	NavicIconsEvent = { fg = "yellow" },
	NavicIconsOperator = { fg = "light_grey" },
	NavicIconsTypeParameter = { fg = "red" },
	NavicIconsNull = { fg = "light_grey" },
	NavicIconsObject = { fg = "dark_purple" },
	NavicIconsArray = { fg = "cyan" },
	NavicIconsBoolean = { fg = "green" },
	NavicIconsNumber = { fg = "red" },
	NavicIconsString = { fg = "green" },
	NavicIconsPackage = { fg = "dark_purple" },
	NavicIconsNamespace = { fg = "orange" },
	NavicText = { fg = "white" },
	NavicSeparator = { fg = "#ffffff" },
}

return M
