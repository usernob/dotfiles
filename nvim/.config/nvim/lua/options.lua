require("nvchad.options")

vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

vim.g.codeium_no_map_tab = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldenable = false
