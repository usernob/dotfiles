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
		opts = {},
	},
	{ "folke/neodev.nvim", ft = "lua", opts = {} },
}
