return {
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local helpers = require("null-ls.helpers")

			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local opts = {}

			opts.sources = {
				formatting.stylua,
				formatting.prettier,
				formatting.clang_format,
				formatting.cmake_format,
				formatting.biome,

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

			-- local codespell_ca = {
			-- 	method = null_ls.methods.CODE_ACTION,
			-- 	filetypes = {},
			-- 	generator = helpers.generator_factory({
			-- 		command = "codespell",
			-- 		args = { "$FILENAME" },
			-- 		to_stdin = true,
			-- 		format = "line",
			-- 		from_stderr = false,
			-- 		check_exit_code = function(code, stderr)
			-- 			local success = code <= 1
			--
			-- 			if not success then
			-- 				-- can be noisy for things that run often (e.g. diagnostics), but can
			-- 				-- be useful for things that run on demand (e.g. formatting)
			-- 				print(stderr)
			-- 			end
			--
			-- 			return success
			-- 		end,
			--
			-- 		on_output = function(line, params)
			-- 			return {
			-- 				title = "hello",
			-- 				action = function()
			-- 					print(line)
			-- 				end,
			-- 			}
			-- 		end,
			-- 	}),
			-- }
			--
			-- null_ls.register(codespell_ca)
		end,
	},
}
