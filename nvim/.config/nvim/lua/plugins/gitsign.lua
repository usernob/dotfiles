return {
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
        preview_config = {
            border = "rounded",
        },
    },
    keys = {
        { "]g", "<CMD>Gitsigns next_hunk<CR>" },
        { "[g", "<CMD>Gitsigns prev_hunk<CR>" },
    },
}
