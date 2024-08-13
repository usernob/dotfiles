---@type ChadrcConfig
local M = {}

local highlights = require("highlights")

M.ui = {
	theme = "onedark",
	lsp_semantic_tokens = true,
	hl_override = highlights.override,
	hl_add = highlights.add,

	tabufline = require("tabufline"),
	statusline = require("statusline"),

	cmp = {
		style = "atom_colored",
	},
	nvdash = {
		load_on_startup = true,
	},
}

M.lsp = { signature = false }

M.base46 = {
	integrations = {
		"dap",
		"neogit",
	},
}

return M
