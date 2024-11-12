local map = vim.keymap.set

map("n", "<leader>cd", "<CMD>cd %:p:h<CR>", { desc = "cd to current directory of this file" })

map("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "Toggle inlay hints" })

map("n", "<S-Right>", "<CMD>bn<CR>", { desc = "buffer next" })
map("n", "<S-Left>", "<CMD>bp<CR>", { desc = "buffer prev" })
map("n", "<C-h>", "<C-w>h", { desc = "left window" })
map("n", "<C-j>", "<C-w>j", { desc = "bot window" })
map("n", "<C-k>", "<C-w>k", { desc = "top window" })
map("n", "<C-l>", "<C-w>l", { desc = "rigth window" })
