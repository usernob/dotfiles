return {
    --This is a list of plugins that do not require additional configuration
    { "wakatime/vim-wakatime", event = "VeryLazy" },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            indent = { char = "│" },
            scope = { char = "│" },
        },
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
            signs_staged = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "-" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "?" },
            },
        },
        keys = {
            { "]g", "<CMD>Gitsigns next_hunk<CR>" },
            { "[g", "<CMD>Gitsigns prev_hunk<CR>" },
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

    { "b0o/schemastore.nvim" },

    {
        "numToStr/Comment.nvim",
        opts = {},
        keys = {
            { "gc", mode = { "n", "v" } },
            { "gb", mode = { "n", "v" } },
            { "gbc", mode = { "n", "v" } },
        },
    },

    {
        "sindrets/diffview.nvim",
        opts = {
            enchanced_diff_hl = true,
        },
    },
}
