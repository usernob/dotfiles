return {
	--This is a list of plugins that do not require additional configuration
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "BufReadPost",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufReadPost",
		cond = false,
		opts = {
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*\d*:]],
				after = "",
			},
			pattern = [[\b(KEYWORDS)\s*\d*:]],
		},
	},
	{
		"m-demare/hlargs.nvim",
		event = "BufReadPost",
		opts = {
			highlight = { link = "@variable.parameter" },
		},
	},
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		opts = {
			easing = "quadratic",
		},
		config = function(_, opts)
			local neoscroll = require("neoscroll")
			neoscroll.setup(opts)

			vim.keymap.set("n", "<PageUp>", function()
				neoscroll.ctrl_b({ duration = 250 })
			end)

			vim.keymap.set("n", "<PageDown>", function()
				neoscroll.ctrl_f({ duration = 250 })
			end)
		end,
	},
	{
		"nmac427/guess-indent.nvim",
		event = "BufReadPost",
		opts = {
			auto_cmd = true, -- Set to false to disable automatic execution
			override_editorconfig = false, -- Set to true to override settings set by .editorconfig
			filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
				"netrw",
				"tutor",
			},
			buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
				"help",
				"nofile",
				"terminal",
				"prompt",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		keys = {
			{
				"-",
				"<CMD>Oil<CR>",
				desc = "Open parent directory",
			},
		},
	},
	{
		"NvChad/base46",
		branch = "blending-colors",
		url = "https://github.com/usernob/base46",
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "blankline")
			require("ibl").setup(opts)
		end,
	},
}
