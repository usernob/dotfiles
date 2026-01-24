--- @module "lazy.types"
--- @type LazySpec
-- This is a list of plugins that doesn't require complex configuration
return {
    { "wakatime/vim-wakatime", cond = false, event = "VeryLazy" },
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
        --- @module "ibl"
        --- @type ibl.config
        opts = {
            indent = { char = "│" },
            scope = { char = "│", enabled = true },
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
        cmd = "DiffviewOpen",
    },
}
