return {
    "luukvbaal/statuscol.nvim",
    event = "BufReadPost",
    opts = {},
    config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            relculright = true,
            segments = {
                { text = { "%s" }, click = "v:lua.ScSa" },
                { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
            },
            ft_ignore = { "NvimTree_1", "man" },
            bt_ignore = { "nofile", "help", "terminal" },
        })
    end,
}
