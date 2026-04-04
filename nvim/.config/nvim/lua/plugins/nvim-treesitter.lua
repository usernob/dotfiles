return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = function()
            local nvim_treesitter = require("nvim-treesitter")

            local ensure_installed = {
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
            }

            local installed = nvim_treesitter.get_installed()

            local to_install = {}
            for _, value in ipairs(ensure_installed) do
                if not vim.list_contains(installed, value) then
                    to_install[#to_install + 1] = value
                end
            end
            if #to_install > 0 then
                nvim_treesitter.install(to_install)
            end
            vim.cmd("TSUpdate")
        end,
        config = function()
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = "VeryLazy",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true

            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
        end,
        config = function()
            local textobjects = require("nvim-treesitter-textobjects")
            textobjects.setup({
                select = {
                    lookahead = true,
                    selection_modes = {
                        ["@parameter.outer"] = "v", -- charwise
                        ["@function.outer"] = "V", -- linewise
                        -- ['@class.outer'] = '<c-v>', -- blockwise
                    },
                },
            })

            local keymaps = {
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
            }

            local textobjects_select = require("nvim-treesitter-textobjects.select")
            for key, value in pairs(keymaps) do
                vim.keymap.set({ "x", "o" }, key, function()
                    textobjects_select.select_textobject(value.query, "textobjects")
                end, { desc = value.desc })
            end
        end,
    },
}
