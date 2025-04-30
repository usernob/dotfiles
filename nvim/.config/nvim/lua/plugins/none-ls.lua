return {
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            local code_action = null_ls.builtins.code_actions
            local opts = {}

            opts.sources = {
                code_action.gitsigns,

                formatting.stylua,
                formatting.prettierd,
                formatting.clang_format,
                formatting.cmake_format,
                formatting.biome,
                formatting.nixfmt,

                diagnostics.cmake_lint,
            }

            -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            --
            -- opts.on_attach = function(client, bufnr)
            -- 	if client.supports_method("textDocument/formatting") then
            -- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            -- 		vim.api.nvim_create_autocmd("BufWritePre", {
            -- 			group = augroup,
            -- 			buffer = bufnr,
            -- 			callback = function()
            -- 				vim.lsp.buf.format({
            -- 					filter = function(lspclient)
            -- 						return lspclient.name == "null-ls"
            -- 					end,
            -- 					bufnr = bufnr,
            -- 				})
            -- 			end,
            -- 		})
            -- 	end
            -- end

            null_ls.setup(opts)

            for _, mode in pairs({ "n", "v" }) do
                vim.keymap.set(mode, "<leader>fm", function()
                    vim.lsp.buf.format({
                        async = true,
                        filter = function(client)
                            return client.name == "null-ls"
                        end,
                    })
                end, { desc = "format with null-ls" })
            end
        end,
    },
}
