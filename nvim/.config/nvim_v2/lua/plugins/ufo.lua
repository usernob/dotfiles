return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"luukvbaal/statuscol.nvim",
		},
		event = "BufReadPost",
		opts = {},
		config = function(_, opts)
			local ufo = require("ufo")
			ufo.setup(opts)
			vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "open all fold" })
			vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "close all fold" })
			vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "toggle fold under cursor" })
			vim.keymap.set("n", "zm", ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
			vim.keymap.set("n", "K", function()
				local winid = ufo.peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end, { desc = "LSP hover / fold hover" })
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
				},
				ft_ignore = { "NvimTree_1", "man" },
				bt_ignore = { "nofile", "help", "terminal" },
			})
		end,
	},
}
