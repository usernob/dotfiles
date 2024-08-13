return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			view = "cmdline",
		},
		lsp = {
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
			progress = {
				view = "mini",
				opts = {
					position = {
						col = 0,
					},
				},
			},
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		routes = {
			{
				filter = { event = "msg_showmode" },
				view = "notify",
			},
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				view = "mini",
			},
			{
				filter = {
					event = "msg_show",
					kind = "search_count",
				},
				view = "mini",
			},
		},
		views = {
			mini = {
				timeout = 3000,
				position = {
					row = 0,
				},
				size = "auto",
				border = {
					style = "none",
					padding = {
						1, -- vertical
						3, -- horizontal
					},
				},
				win_options = {
					winblend = 0,
				},
			},
		},
	},

	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
