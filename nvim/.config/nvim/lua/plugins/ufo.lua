return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
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
				})
			end,
		},
	},
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require("ufo").setup(opts)
		vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "open all fold" })
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "close all fold" })
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "toggle fold under cursor" })
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
		vim.keymap.set("n", "K", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "LSP hover / fold hover" })
	end,
}
