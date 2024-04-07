require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<leader>cd", "<CMD>cd %:p:h<CR>", { desc = "cd to current directory of this file" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
