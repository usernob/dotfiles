return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"vim",
			"lua",
			"html",
			"css",
			"javascript",
			"typescript",
			"c",
			"markdown",
			"markdown_inline",
			"ini",
			"xml",
			"yaml",
		},
		indent = {
			enable = true,
			disable = {
				"python",
			},
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = false,
				node_incremental = "g)",
				scope_incremental = "g}",
				node_decremental = "g(",
			},
		},
		textobject = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["aB"] = "@block.outer",
					["iB"] = "@block.inner",
					["ic"] = "@conditional.inner",
					["ac"] = "@conditional.outer",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["is"] = "@statement.inner",
					["as"] = "@statement.outer",
					["aC"] = "@class.outer",
					["iC"] = "@class.inner",
				},
			},
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
