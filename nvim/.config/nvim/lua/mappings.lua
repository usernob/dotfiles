require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", "<leader>cd", "<CMD>cd %:p:h<CR>", { desc = "cd to current directory of this file" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "Toggle inlay hints" })

map("n", "t", "<CMD>tabnext<CR>", { desc = "Next tab" })
map("n", "T", "<CMD>tabprevious<CR>", { desc = "Previous tab" })
