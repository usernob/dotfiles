require("nvchad.options")

vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

vim.g.codeium_no_map_tab = true
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
  diff = "╱"
}
vim.opt.foldtext = ""
vim.opt.foldenable = true

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
