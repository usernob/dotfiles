return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		event = "VeryLazy",
		opts = {
			defaults = {
				mappings = {
					i = {
						["<Tab>"] = require("telescope.actions").move_selection_next,
						["<S-Tab>"] = require("telescope.actions").move_selection_previous,
						["<esc>"] = require("telescope.actions").close,
					},
				},
			},
			extensions_list = {
				"fzf",
				"ui-select",
			},
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
