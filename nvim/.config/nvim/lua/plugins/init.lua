return {
	--This is a list of plugins that do not require additional configuration
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*\d*:]],
			},
		},
	},
	{
		"folke/neodev.nvim",
		ft = "lua",
		opts = {
			library = {
				plugins = { "nvim-dap-ui" },
				types = true,
			},
		},
	},
	{
		"Civitasv/cmake-tools.nvim",
		event = "VeryLazy",
		ft = "cmake",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
