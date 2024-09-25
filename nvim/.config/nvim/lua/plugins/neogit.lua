return {
	"NeogitOrg/neogit",
	cmd = { "Neogit", "NeogitResetState" },
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		"nvim-telescope/telescope.nvim", -- optional
	},
	opts = {
		graph_style = "unicode",
		signs = {
			-- { CLOSED, OPENED }
			hunk = { "", "" },
			item = { "", "" },
			section = { "", "" },
		},
		integration = {
			diffview = true,
		},
	},
}
