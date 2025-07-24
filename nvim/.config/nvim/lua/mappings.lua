local map = vim.keymap.set

map("n", "<esc>", "<CMD>noh<CR>", { desc = "Clear highlight" })
map("n", "<leader>cd", "<CMD>cd %:p:h<CR>", { desc = "cd to current directory of this file" })

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
