return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "vim",
            "vimdoc",
            "lua",
            "html",
            "css",
            "javascript",
            "typescript",
            "c",
            "cpp",
            "markdown",
            "markdown_inline",
            "ini",
            "xml",
            "yaml",
            "lua",
            "luadoc",
            "printf",
            "comment",
        },
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
            disable = {
                "python",
            },
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = false,
                node_incremental = "g)",
                scope_incremental = "g}",
                node_decremental = "g(",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["aB"] = { query = "@block.outer", desc = "select outer block" },
                    ["iB"] = { query = "@block.inner", desc = "select inner block" },
                    ["ic"] = { query = "@conditional.inner", desc = "select outer condition" },
                    ["ac"] = { query = "@conditional.outer", desc = "select inner condition" },
                    ["af"] = { query = "@function.outer", desc = "select outer function" },
                    ["if"] = { query = "@function.inner", desc = "select inner function" },
                    ["al"] = { query = "@loop.outer", desc = "select outer loop" },
                    ["il"] = { query = "@loop.inner", desc = "select inner loop" },
                    ["is"] = { query = "@statement.inner", desc = "select outer statement" },
                    ["as"] = { query = "@statement.outer", desc = "select inner statement" },
                    ["aC"] = { query = "@class.outer", desc = "select outer class" },
                    ["iC"] = { query = "@class.inner", desc = "select inner class" },
                },
            },
        },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
