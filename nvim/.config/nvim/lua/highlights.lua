-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

-- local base16 = require("base46").get_theme_tb "base_16"
-- local colors = require("base46").get_theme_tb "base_30"

local vim_error = "DiagnosticError"
local vim_warn = "DiagnosticWarn"
local vim_info = "DiagnosticInfo"
local vim_hint = "DiagnosticHint"

---convert hex to r, g, b values
---@param hex string
---@return number?
---@return number?
---@return number?
local function hexToRGB(hex)
	hex = hex:gsub("#", "")
	return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

---convert r, g, b values to hex format
---@param r integer
---@param g integer
---@param b integer
---@return string
function RGBToHex(r, g, b)
	return string.format("#%02X%02X%02X", r, g, b)
end

---bend 2 color
---@param hex1 string
---@param hex2 string
---@param step string
---@param total string
---@return string
local function color_bend(hex1, hex2, step, total)
	local r1, g1, b1 = hexToRGB(hex1)
	local r2, g2, b2 = hexToRGB(hex2)
	local t = step / total

	local r = r1 + (r2 - r1) * t
	local g = g1 + (g2 - g1) * t
	local b = b1 + (b2 - b1) * t

	return RGBToHex(math.floor(r), math.floor(g), math.floor(b))
end

local function get_default_diagnostic_colors(bg_color, hl_group, step, total)
	local fg = string.format("#%06x", vim.api.nvim_get_hl(0, {name = hl_group}).fg)

	return color_bend(bg_color, fg, step, total)
end

local function get_default_theme_bg_color()
	local theme_color = vim.api.nvim_get_hl(0, { name = "Normal" }).bg

	if theme_color ~= nil then
		return string.format("#%06x", theme_color)
	else
		return "#1e222a"
	end
end

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
	DiagnosticLineHlError = {
		fg = nil,
		bg = get_default_diagnostic_colors(get_default_theme_bg_color(), vim_error, 7, 30),
	},
	DiagnosticLineHlInfo = {
		fg = nil,
		bg = get_default_diagnostic_colors(get_default_theme_bg_color(), vim_info, 7, 30),
	},
	DiagnosticLineHlHint = {
		fg = nil,
		bg = get_default_diagnostic_colors(get_default_theme_bg_color(), vim_hint, 7, 30),
	},
	DiagnosticLineHlWarn = {
		fg = nil,
		bg = get_default_diagnostic_colors(get_default_theme_bg_color(), vim_warn, 7, 30),
	},
}

return M
