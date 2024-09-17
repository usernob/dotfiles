return {
	"NeogitOrg/neogit",
	cmd = { "Neogit", "NeogitResetState" },
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
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
	config = function(_, opts)
		dofile(vim.g.base46_cache .. "neogit")
		require("neogit").setup(opts)
	end,
}
