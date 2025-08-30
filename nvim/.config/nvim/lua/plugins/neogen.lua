return {
    "danymat/neogen",
    event = "VeryLazy",
    opts = {
        snippet_engine = "luasnip",
    },
    config = function(_, opts)
        local neogen = require("neogen")
        neogen.setup(opts)

        vim.keymap.set(
            { "n", "v" },
            "<leader>dn",
            neogen.generate,
            { silent = true, desc = "Neogen Generate" }
        )
    end,
}
