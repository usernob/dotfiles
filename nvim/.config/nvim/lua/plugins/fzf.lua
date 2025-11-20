return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    event = "VeryLazy",
    config = function(_, _)
        local fzf = require("fzf-lua")
        local opts = {
            fzf_colors = true,
            lsp = {
                symbols = {
                    symbol_icons = require("kind"),
                },
            },
        }
        fzf.setup(opts)
        fzf.register_ui_select()

        local map = vim.keymap.set
        map("n", "<leader><leader>", "<CMD>FzfLua<CR>", { desc = "fzf-lua", noremap = true })
        map("n", "<leader>fg", fzf.global, { desc = "fzf-lua Global Search" })
        map("n", "<leader>ff", fzf.files, { desc = "fzf-lua Find Files" })
        map("n", "<leader>fw", fzf.live_grep, { desc = "fzf-lua Live Grep" })
        map("n", "<leader>fb", fzf.buffers, { desc = "fzf-lua Buffers" })
        map("n", "<leader>fd", fzf.diagnostics_workspace, { desc = "fzf-lua Diagnostics" })
        map("n", "<leader>fr", fzf.lsp_finder, { desc = "fzf-lua Lsp Finder" })
        map("n", "<leader>gr", fzf.lsp_references, { desc = "fzf-lua Lsp Reference" })
        map("n", "<leader>gd", fzf.lsp_definitions, { desc = "fzf-lua Lsp Definition" })
    end,
}
