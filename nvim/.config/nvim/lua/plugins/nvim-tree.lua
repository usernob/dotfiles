return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		filters = {
			dotfiles = true,
		},
		git = {
			enable = true,
			show_on_open_dirs = false,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = false,
		},

		view = {
			signcolumn = "no",
		},

		renderer = {
			root_folder_label = ":p:h",
			highlight_git = true,
			indent_markers = {
				enable = true,
			},
			icons = {
				diagnostics_placement = "after",
				show = {
					git = true,
				},
				-- glyphs = {
				-- 	folder = {
				-- 		default = "",
				-- 	},
				-- },
			},
		},
	},
}
