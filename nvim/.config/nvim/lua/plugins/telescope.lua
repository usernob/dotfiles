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
        cond = false,

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
                preview = {
                    filesize_limit = 0.1, -- MB
                },
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                -- Developer configurations: Not meant for general override
                mappings = {
                    i = {
                        ["<Tab>"] = require("telescope.actions").move_selection_next,
                        ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
                        ["<esc>"] = require("telescope.actions").close,
                        ["<C-s>"] = require("telescope.actions").toggle_selection,
                    },
                },

                file_ignore_patterns = {
                    "^.git/",
                    "^.github/",
                    "^node_modules/",
                    "^build/",
                    "^target/",
                    "^vendor/",
                    "^external/",
                    "%.gz$",
                    "%.gif$",
                    "%.mp4$",
                    "%.mkv$",
                    "%.pdf$",
                    "%.zip$",
                },
            }

            options.pickers = {
                diagnostics = {
                    theme = "ivy",
                },
                buffers = {
                    mappings = {
                        i = { ["<C-d>"] = require("telescope.actions").delete_buffer },
                    },
                },
            }

            options.extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_cursor({}),
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
            map(
                "n",
                "<leader><leader>",
                "<CMD>Telescope<CR>",
                { desc = "Telescope", noremap = true }
            )
            map("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
            map("n", "<leader>fw", builtin.live_grep, { desc = "Telescope Live Grep" })
            map("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
            map("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope Diagnostics" })
            map("n", "<leader>gr", builtin.lsp_references, { desc = "Telescope Lsp Reference" })
            map("n", "<leader>gd", builtin.lsp_definitions, { desc = "Telescope Lsp Definitions" })
        end,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
}
