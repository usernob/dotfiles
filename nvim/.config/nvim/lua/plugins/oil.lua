return {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {
        default_file_explorrer = true,
        win_options = {
            signcolumn = "yes",
            foldcolumn = "1",
        },
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
        },
        keymaps = {
            ["gy"] = { "actions.yank_entry" },
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    keys = {
        {
            "-",
            "<CMD>Oil<CR>",
            desc = "Open parent directory",
        },
    },
}
