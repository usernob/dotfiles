vim.g.mapleader = " "

require("options")
require("mappings")
require("autocmd")
require("highlights")
require("filetype")
require("lsp")
vim.o.statusline = "%!v:lua.require('statusline')()"
-- vim.o.statusline = " %(%r %)%{%&bt==''?&ft==''?'%f':'%f %LL %m%=%l,%-2c':''%} "
-- vim.cmd('colorscheme test')

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("lazy-config")

-- load plugins
require("lazy").setup({
    { import = "plugins" },
}, lazy_config)
