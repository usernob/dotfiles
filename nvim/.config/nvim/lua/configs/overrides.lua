local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"c",
		"markdown",
		"markdown_inline",
		"ini",
		"xml",
		"yaml",
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = false,
			node_incremental = "g)",
			scope_incremental = "g}",
			node_decremental = "g(",
		},
	},
	textobject = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["aB"] = "@block.outer",
				["iB"] = "@block.inner",
				["ic"] = "@conditional.inner",
				["ac"] = "@conditional.outer",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["is"] = "@statement.inner",
				["as"] = "@statement.outer",
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
			},
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		-- "deno",
	},
}

-- git support in nvimtree
M.nvimtree = {
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
}

M.colorizer = {
	filetypes = { "*" },
	user_default_options = {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = false, -- "Name" codes like Blue or blue
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		AARRGGBB = false, -- 0xAARRGGBB hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = true, -- CSS hsl() and hsla() functions
		css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		-- Available modes for `mode`: foreground, background,  virtualtext
		mode = "background", -- Set the display mode.
		-- Available methods are false / true / "normal" / "lsp" / "both"
		-- True is same as normal
		tailwind = true, -- Enable tailwind colors
		-- parsers can contain values used in |user_default_options|
		sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
		virtualtext = "■",
		-- update color values even if buffer is not focused
		-- example use: cmp_menu, cmp_docs
		always_update = false,
	},
	-- all the sub-options of filetypes apply to buftypes
	buftypes = {},
}

return M
