local map = vim.keymap.set

map("n", "<leader>cd", "<CMD>cd %:p:h<CR>", { desc = "cd to current directory of this file" })

map("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "Toggle inlay hints" })

map("n", "<Tab>", "<CMD>bn<CR>", { desc = "buffer next" })
map("n", "<S-Tab>", "<CMD>bp<CR>", { desc = "buffer prev" })

map("n", "<C-h>", "<C-w>h", { desc = "left window", noremap = true })
map("n", "<C-j>", "<C-w>j", { desc = "bot window", noremap = true })
map("n", "<C-k>", "<C-w>k", { desc = "top window", noremap = true })
map("n", "<C-l>", "<C-w>l", { desc = "right window", noremap = true })

map("i", "<C-h>", "<Left>", { desc = "left" })
map("i", "<C-j>", "<Down>", { desc = "bot" })
map("i", "<C-k>", "<Up>", { desc = "top" })
map("i", "<C-l>", "<Right>", { desc = "right" })

map("n", "<leader>x", ":.lua<CR>", { desc = "LUA: run this current line" })
map("v", "<leader>x", ":lua<CR>", { desc = "LUA: run this selection line" })
map("n", "<leader>X", "<CMD>source %<CR>", { desc = "LUA: source this file" })

-- disable arrow keys
local opts = { noremap = true, silent = true }
for _, value in pairs({ "<Up>", "<Right>", "<Down>", "<Left>" }) do
	map("n", value, "<Nop>", opts)
	map("i", value, "<Nop>", opts)
	map("v", value, "<Nop>", opts)
end

map("n", "<C-i>", "<CMD>Inspect<CR>", { desc = "Inspect token under cursor", noremap = true })
map("i", "<C-i>", "<CMD>Inspect<CR>", { desc = "Inspect token under cursor", noremap = true })
