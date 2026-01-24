--- @module 'lazy.types'
--- @type LazySpec
return {
    "Exafunction/windsurf.nvim",
    event = "InsertEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local opts = {
            enable_cmp_source = false,
            virtual_text = {
                enabled = true,
                key_bindings = {
                    -- Accept the current completion.
                    accept = "<C-g>",
                    -- Accept the next word.
                    accept_word = false,
                    -- Accept the next line.
                    accept_line = false,
                    -- Clear the virtual text.
                    clear = false,
                    -- Cycle to the next completion.
                    next = "<M-]>",
                    -- Cycle to the previous completion.
                    prev = "<M-[>",
                },
            },
            workspace_root = {
                use_lsp = true,
                find_root = nil,
                paths = {
                    ".bzr",
                    ".git",
                    ".hg",
                    ".svn",
                    "_FOSSIL_",
                    "package.json",
                    "CMakeLists.txt",
                },
            },
        }
        require("codeium").setup(opts)
        -- hack to make virtual_text match the colorscheme
        vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment" })
    end,
}
