local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------

g.codeium_no_map_tab = true
g.codeium_bin = "/etc/profiles/per-user/usernob/bin/codeium_language_server" -- hardcoded for nixos only

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-------------------------------------- options ------------------------------------------

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true

-- fold
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldtext = ""
opt.foldenable = true

-- misc
opt.laststatus = 2
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorlineopt = "both"
opt.fillchars = {
    eob = " ",
    fold = " ",
    foldopen = "",
    foldsep = " ",
    foldclose = "",
    diff = "╱",
    lastline = ">",
}

-- disable nvim intro
-- opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.wrap = false

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

