local overrides = require("configs.overrides")

return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},

	-- In order to modify the `lspconfig` configuration:
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	-- ovveride plugins

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		opts = overrides.blankline,
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = overrides.colorizer,
	},

	-- added plugin
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<C-d>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<C-f>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<M-w>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},

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
	{
		"chikko80/error-lens.nvim",
		event = "LspAttach",
		opts = {
			enabled = true,
      auto_adjust = {
        enable = true,
        fallback_bg_color = "#1e222a",
        step = 7,
        total = 40
      },
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
}
