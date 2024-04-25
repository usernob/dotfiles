---@type ChadrcConfig
local M = {}

local highlights = require("highlights")

M.ui = {
	theme = "onedark",
	lsp_semantic_tokens = true,
	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = require("statusline"),

	cmp = {
		style = "atom_colored",
	},
}

return M
