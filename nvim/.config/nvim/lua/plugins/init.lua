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
