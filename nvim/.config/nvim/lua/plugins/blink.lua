return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            dependencies = { "rafamadriz/friendly-snippets" },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_lua").lazy_load({
                    paths = { "~/.config/nvim/snippets/" },
                })
            end,
        },
    },
    event = { "InsertEnter", "CmdlineEnter" },

    cond = function()
        return vim.g.blink
    end,
    -- use a release tag to download pre-built binaries
    version = "*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
            preset = "none",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "snippet_forward", "fallback" },
            ["<C-p>"] = { "snippet_backward", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<C-e>"] = { "cancel", "fallback" },
            ["<C-y>"] = { "show", "fallback" },
        },
        appearance = {
            kind_icons = require("kind"),
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "normal",
        },
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = true,
                },
            },
            accept = { auto_brackets = { enabled = true } },
            menu = {
                draw = {
                    padding = 1,
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                    },
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                return " " .. ctx.kind_icon .. " "
                            end,
                        },
                        kind = {
                            text = function(ctx)
                                return ctx.kind and "(" .. ctx.kind .. ")" or ""
                            end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = {
                    border = "single",
                },
            },
        },

        signature = {
            enabled = true,
            window = {
                border = "single",
                show_documentation = true,
            },
        },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
        snippets = {
            preset = "luasnip",
        },
    },
    opts_extend = { "sources.default" },
}
