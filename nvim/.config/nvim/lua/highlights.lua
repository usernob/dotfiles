-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

-- local base16 = require("base46").get_theme_tb "base_16"
-- local colors = require("base46").get_theme_tb "base_30"

-- ---convert hex to r, g, b values
-- ---@param hex string
-- ---@return number?
-- ---@return number?
-- ---@return number?
-- local function hexToRGB(hex)
-- 	hex = hex:gsub("#", "")
-- 	return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
-- end
--
-- ---convert r, g, b values to hex format
-- ---@param r integer
-- ---@param g integer
-- ---@param b integer
-- ---@return string
-- function RGBToHex(r, g, b)
-- 	return string.format("#%02X%02X%02X", r, g, b)
-- end
--
-- -- #1e222a
-- -- rgb(30,34,42)
-- -- #e06c75
-- -- rgb(224, 108, 117)
-- -- rgb(74, 51, 58)
--
-- ---bend 2 color
-- ---@param hex1 string
-- ---@param hex2 string
-- ---@param step string
-- ---@param total string
-- ---@return string
-- local function color_bend(hex1, hex2, step, total)
-- 	local r1, g1, b1 = hexToRGB(hex1)
-- 	local r2, g2, b2 = hexToRGB(hex2)
-- 	local t = step / total
--
-- 	local r = r1 + (r2 - r1) * t
-- 	local g = g1 + (g2 - g1) * t
-- 	local b = b1 + (b2 - b1) * t
--
-- 	return RGBToHex(math.floor(r), math.floor(g), math.floor(b))
-- end
--
-- local function get_default_diagnostic_colors(bg_color, hl_group, step, total)
-- 	local fg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = hl_group }).fg)
--
-- 	return color_bend(bg_color, fg, step, total)
-- end
--
-- local function get_default_theme_bg_color()
-- 	local theme_color = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
--
-- 	if theme_color ~= nil then
-- 		return string.format("#%06x", theme_color)
-- 	else
-- 		return "#1e222a"
-- 	end
-- end

local M = {}

---@type HLTable
M.override = {
	CursorLine = {
		bg = "black2",
	},
	-- LineNr = {
	-- 	fg = "grey_fg",
	-- },
	Comment = {
		link = "@comment",
	},
	["@comment"] = {
		fg = "grey_fg2",
		italic = true,
	},
	LspInlayHint = {
		italic = true,
		fg = "grey_fg",
		bg = "NONE",
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
	DiffAdd = { fg = "NONE", bg = { "green", -40 }, underline = false },
	DiffDelete = { fg = "grey", bg = "black" },
	DiffText = { fg = "NONE", bg = { "blue", -40 } },
	DiffChange = { fg = "NONE", bg = { "blue", -50 } },

	DiffAdded = { fg = "green" },
	DiffRemoved = { fg = "red" },

	St_sep_r = { fg = "black", bg = "black" },
	St_EmptySpace = { fg = "black", bg = "black" },

	St_file_txt = { bg = "black" },
	St_Pos_txt = { bg = "black" },
	St_cwd_txt = { bg = "black" },
	St_lsp_txt = { bg = "black" },

	St_NormalmodeText = { bg = "black" },
	St_VisualmodeText = { bg = "black" },
	St_InsertmodeText = { bg = "black" },
	St_TerminalmodeText = { bg = "black" },
	St_NTerminalmodeText = { bg = "black" },
	St_ReplacemodeText = { bg = "black" },
	St_ConfirmmodeText = { bg = "black" },
	St_CommandmodeText = { bg = "black" },
	St_SelectmodeText = { bg = "black" },

	TbFill = { bg = "black" },
	TbBufOn = { bold = true },
	TbBufOff = { bg = "black" },
	TbBufOffClose = { bg = "black" },
	TbBufOffModified = { bg = "black" },

	["@comment.todo"] = { bg = "NONE", fg = "green", bold = true, underline = true },
	["@comment.error"] = { bg = "NONE", fg = "red", bold = true, underline = true },
	["@comment.danger"] = { bg = "NONE", fg = "red", bold = true, underline = true },
	["@comment.note"] = { bg = "NONE", fg = "purple", bold = true, underline = true },
	["@comment.warning"] = { bg = "NONE", fg = "yellow", bold = true, underline = true },
}

---@type HLTable
M.add = {
	CodeiumSuggestion = { fg = "grey_fg2", italic = true },
	St_Codeium_bg = { bg = "vibrant_green", fg = "black" },
	St_Codeium_txt = { bg = "black", fg = "vibrant_green" },
	St_Codeium_sep = { bg = "black", fg = "vibrant_green" },
	DiagnosticLineHlError = {
		fg = nil,
		bg = { "red", 5 }, -- get_default_diagnostic_colors(get_default_theme_bg_color(), "DiagnosticError", 7, 30),
	},
	DiagnosticLineHlInfo = {
		fg = nil,
		bg = { "blue", 5 }, -- get_default_diagnostic_colors(get_default_theme_bg_color(), "DiagnosticInfo", 9, 30),
	},
	DiagnosticLineHlHint = {
		fg = nil,
		bg = { "purple", 5 }, -- get_default_diagnostic_colors(get_default_theme_bg_color(), "DiagnosticHint", 7, 30),
	},
	DiagnosticLineHlWarn = {
		fg = nil,
		bg = { "yellow", 5 }, -- get_default_diagnostic_colors(get_default_theme_bg_color(), "DiagnosticWarn", 9, 30),
	},

	-- NOTE: aaaaa
	-- PERF: aaaaa
	-- WARNING: aaaaaa
	-- TODO: aaaaa
	NotifyERRORBorder = { link = "DiagnosticError" },
	NotifyWARNBorder = { link = "DiagnosticWarn" },
	NotifyINFOBorder = { link = "DiagnosticInfo" },
	NotifyTRACEBorder = { link = "DiagnosticHint" },
	NotifyERRORIcon = { link = "DiagnosticError" },
	NotifyWARNIcon = { link = "DiagnosticWarn" },
	NotifyINFOIcon = { link = "DiagnosticInfo" },
	NotifyTRACEIcon = { link = "DiagnosticHint" },
	NotifyERRORTitle = { link = "DiagnosticError" },
	NotifyWARNTitle = { link = "DiagnosticWarn" },
	NotifyINFOTitle = { link = "DiagnosticInfo" },
	NotifyTRACETitle = { link = "DiagnosticHint" },
}

return M
