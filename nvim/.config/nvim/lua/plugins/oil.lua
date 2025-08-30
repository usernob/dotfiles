return {
    {
        "stevearc/oil.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            { "benomahony/oil-git.nvim", cond = true },
            { "JezerM/oil-lsp-diagnostics.nvim", cond = false },
        },
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
                ["gy"] = { "actions.yank_entry", opts = { modify = ":t" } },
            },
        },
        keys = {
            {
                "-",
                "<CMD>Oil<CR>",
                desc = "Open parent directory",
            },
        },
    },

    {
        "benomahony/oil-git.nvim",
        config = function(_, _)
            local set = vim.api.nvim_set_hl

            set(0, "OilGitAdded", { link = "Added" })
            set(0, "OilGitModified", { link = "Changed" })
            set(0, "OilGitRenamed", { link = "Statement" })
            set(0, "OilGitUntracked", { link = "Operator" })
            set(0, "OilGitIgnored", { link = "Comment" })
        end,
    },
}
