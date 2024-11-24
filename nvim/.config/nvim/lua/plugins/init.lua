return {
	--This is a list of plugins that do not require additional configuration
	{ "wakatime/vim-wakatime", lazy = false, cond = false },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
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
		event = "VeryLazy",
		opts = {
			default_file_explorrer = true,
			win_options = {
				signcolumn = "yes",
				foldcolumn = "1",
			},
		},
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
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		opts = {
			indent = { char = "│" },
			scope = { char = "│" },
		},
		config = function(_, opts)
			require("ibl").setup(opts)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "?" },
			},
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

	{
		"akinsho/bufferline.nvim",
		event = "BufReadPost",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
	},

	{
		"linrongbin16/lsp-progress.nvim",
		event = "LspAttach",
		opts = {},
	},

	{
		"levouh/tint.nvim",
		event = "VeryLazy",
		opts = {
			tint = -50,
			saturate = 0.8,
		},
	},
}
