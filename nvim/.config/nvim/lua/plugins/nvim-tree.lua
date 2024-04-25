return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		filters = {
			dotfiles = true,
		},
		git = {
			enable = true,
		},
		diagnostics = {
			enable = true,
		},

		renderer = {
			root_folder_label = true,
			highlight_git = true,
			indent_markers = {
				enable = true,
			},
			icons = {
				show = {
					git = true,
				},
				glyphs = {
					folder = {
						default = "",
					},
				},
			},
		},
	},
}
