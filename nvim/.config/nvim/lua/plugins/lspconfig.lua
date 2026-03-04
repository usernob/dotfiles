-- FAQ:
-- Why not use lsp/*.lua files?
-- Because lspconfig will override that files.
-- And i can't control the merging process, that means i can't extend the on_attach function.
--
-- Why not merge with ../lsp.lua?
-- Because server config is depend on lspconfig, and should be configured after lspconfig.
-- Alternatively, after/lsp/*.lua can be used but the reason i don't use it is the same as above and
-- i don't like my lua file outside the lua folder.
--
-- TODO: for now, just wait for this issue(https://github.com/neovim/neovim/issues/33577#issuecomment-3568292351) to be merged
--

--- @param server_config vim.lsp.Config
local lsp_binary_exists = function(server_config)
    local valid_config = server_config.cmd and type(server_config.cmd) == "table" -- or array of string

    if not valid_config then
        return false
    end

    local binary = server_config.cmd[1]

    return vim.fn.executable(binary) == 1
end

--- @type table<string, boolean|vim.lsp.Config>
local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    checkThirdParty = false,
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
                codelens = {
                    enable = true,
                },
                completion = {
                    callSnippet = "Replace",
                },
                hint = {
                    enable = true,
                    setType = true,
                },
            },
        },
    },
    hyprls = {
        filetypes = { "*.hl", "hypr*.conf", ".config/hypr/*.conf", "hyprlang" },
    },
    clangd = {
        cmd = {
            -- see clangd --help-hidden
            "clangd",
            "--background-index",
            -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
            -- to add more checks, create .clang-tidy file in the root directory
            -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
            "--clang-tidy",
            "--completion-style=detailed",
            "--cross-file-rename",
            "--header-insertion=iwyu",
        },
        on_attach = function(_, _)
            vim.keymap.set(
                "n",
                "<leader>sh",
                "<cmd>LspClangdSwitchSourceHeader<cr>",
                { desc = "LSP(clangd) switch between source/header" }
            )
            vim.keymap.set(
                "n",
                "<leader>si",
                "<cmd>LspClangdShowSymbolInfo<cr>",
                { desc = "LSP(clangd) show symbol info" }
            )
        end,
    },
    yamlls = {
        settings = {
            yaml = {
                schemaStore = {
                    -- You must disable built-in schemaStore support if you want to use
                    -- this plugin and its advanced options like `ignore`.
                    enable = false,
                    -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                    url = "",
                },
                schemas = require("schemastore").yaml.schemas(),
            },
        },
    },
    jsonls = {
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    },
    tinymist = {
        settings = {
            lint = {
                enable = true,
                when = "onSave",
            },
            formatterMode = "typstyle",
            exportPdf = "onSave",

            outputPath = "$root/target/$dir/$name",
        },
    },
    pyright = {
        settings = {
            pyright = {
                disableOrganizeImports = true,
            },
            python = {
                analysis = {
                    ignore = { "*" },
                },
            },
        },
    },
    ruff = {
        on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
        end,
    },
    biome = true,
    rust_analyzer = true,
    tailwindcss = true,
    svelte = true,
    taplo = true,
    zls = true,
    nixd = true,
    html = {
        on_attach = function(client)
            vim.lsp.linked_editing_range.enable(true, { client_id = client.id })
        end,
    },
    cssls = true,
    eslint = true,
    emmet_language_server = {
        filetypes = { "php", "html", "blade" },
    },
    ts_ls = true,
    intelephense = true,
    bashls = true,
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        for name, opts in pairs(servers) do
            if type(opts) == "boolean" then
                if not opts then
                    goto continue
                end
                opts = {}
            end
            -- workaround to extend default on attach from lspconfig
            -- TODO: because the type of on_attach is elem_or_list<fun(client: vim.lsp.Client, bufnr: integer)>
            -- maybe we can define that by array of functions?
            local default_on_attach = vim.lsp.config[name].on_attach
            local user_on_attach = opts.on_attach
            opts.on_attach = function(client, bufnr)
                if default_on_attach then
                    default_on_attach(client, bufnr)
                end
                if user_on_attach then
                    user_on_attach(client, bufnr)
                end
            end

            vim.lsp.config(name, opts)
            if lsp_binary_exists(vim.lsp.config[name]) then
                vim.lsp.enable(name)
            end
            ::continue::
        end
    end,
}
