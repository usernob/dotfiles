---@type ChadrcConfig
local M = {}

local highlights = require("highlights")

M.ui = {
	theme = "onedark",
	lsp_semantic_tokens = true,
	hl_override = highlights.override,
	hl_add = highlights.add,

  tabufline = {
    enabled = false
  },
	statusline = require("statusline"),

	cmp = {
		style = "atom_colored",
	},
  nvdash = {
    load_on_startup = true
  }
}

return M
