local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- globals -----------------------------------------

g.codeium_no_map_tab = true
g.codeium_bin = "/etc/profiles/per-user/usernob/bin/codeium_language_server" -- hardcoded for nixos only
g.blink = true

-------------------------------------- options ------------------------------------------
o.laststatus = 2

o.clipboard = "unnamedplus"

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.wrap = false
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99

opt.relativenumber = true
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.cursorline = true
opt.cursorlineopt = "both"
opt.fillchars = {
    eob = " ",
    fold = " ",
    foldopen = "",
    foldsep = " ",
    foldclose = "",
    diff = "╱",
}
opt.foldtext = ""
opt.foldenable = true

-- disable nvim intro
-- opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
