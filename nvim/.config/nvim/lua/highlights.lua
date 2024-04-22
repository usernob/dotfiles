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
}

---@type HLTable
M.add = {
	CodeiumSuggestion = { fg = "grey_fg2", italic = true },
	St_Codeium_bg = { bg = "vibrant_green", fg = "black" },
	St_Codeium_txt = { bg = "one_bg", fg = "vibrant_green" },
	St_Codeium_sep = { bg = "one_bg", fg = "vibrant_green" },
}

return M
