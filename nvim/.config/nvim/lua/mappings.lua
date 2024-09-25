local map = vim.keymap.set

map("n", "<leader>cd", "<CMD>cd %:p:h<CR>", { desc = "cd to current directory of this file" })

map("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "Toggle inlay hints" })
