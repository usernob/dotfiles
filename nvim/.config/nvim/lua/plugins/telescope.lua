return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		cmd = "Telescope",

		config = function()
			local telescope = require("telescope")

			local options = {}

			options.defaults = {
				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					i = {
						["<Tab>"] = require("telescope.actions").move_selection_next,
						["<S-Tab>"] = require("telescope.actions").move_selection_previous,
						["<esc>"] = require("telescope.actions").close,
					},
				},

				file_ignore_patterns = {
					"^.git/",
					"^.github/",
					"^node_modules/",
					"^build/",
					"^target/",
					"^vendor/",
					"%.gz$",
					"%.gif$",
					"%.mp4$",
					"%.mkv$",
					"%.pdf$",
					"%.zip$",
				},
			}

			options.extensions_list = {
				"fzf",
				"ui-select",
			}

			telescope.setup(options)

			for _, extension in pairs(options.extensions_list) do
				telescope.load_extension(extension)
			end

			local builtin = require("telescope.builtin")

			local map = vim.keymap.set
			map("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
			map("n", "<leader>fw", builtin.live_grep, { desc = "Telescope Live Grep" })
			map("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
			map("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope Diagnostics" })
		end,
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
}
