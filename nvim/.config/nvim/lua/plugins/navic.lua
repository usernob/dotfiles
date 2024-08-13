return {
	"utilyre/barbecue.nvim",
	event = "LSPAttach",
	name = "barbecue",
	cond = false,
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		create_autocmd = false,
		attach_navic = false,
		show_modified = true,
		kinds = {
			File = "󰈙",
			Module = "",
			Namespace = "󰌗",
			Package = "",
			Class = "󰌗",
			Method = "󰆧",
			Property = "",
			Field = "",
			Constructor = "",
			Enum = "󰕘",
			Interface = "󰕘",
			Function = "󰊕",
			Variable = "󰆧",
			Constant = "󰏿",
			String = "󰀬",
			Number = "󰎠",
			Boolean = "◩",
			Array = "󰅪",
			Object = "󰅩",
			Key = "󰌋",
			Null = "󰟢",
			EnumMember = "",
			Struct = "󰌗",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰊄",
		},
	},
	config = function(_, opts)
		require("barbecue").setup(opts)
		vim.api.nvim_create_autocmd({
			"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",

			-- include this if you have set `show_modified` to `true`
			"BufModifiedSet",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
