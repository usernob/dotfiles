return {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
        --- @class ServerConfig: vim.lsp.ClientConfig
        --- @field enabled? boolean
        --- @field single_file_support? boolean
        --- @field silent? boolean
        --- @field filetypes? string[]
        --- @field filetype? string
        --- @field root_dir? string|fun(filename: string, bufnr: number)
        --- @field cmd? string[]|fun(dispatchers: vim.lsp.rpc.Dispatchers): vim.lsp.rpc.PublicClient
        --- @field capabilities? lsp.ClientCapabilities
        --- @field settings? table

        --- @type table<string, ServerConfig>
        local servers = {
            denols = {},
            biome = {},
            rust_analyzer = {},
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
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
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
                    "--experimental-modules-support",
                },
                on_attach = function(_, _)
                    vim.keymap.set(
                        "n",
                        "<leader>sh",
                        "<cmd>ClangdSwitchSourceHeader<cr>",
                        { desc = "LSP(clangd) switch between source/header" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>si",
                        "<cmd>ClangdShowSymbolInfo<cr>",
                        { desc = "LSP(clangd) show symbol info" }
                    )
                end,
            },
            tailwindcss = {},
            svelte = {},
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
            taplo = {},
            zls = {},
            cmake = {},
        }

        local lsp_binary_exists = function(server_config)
            local valid_config = server_config.cmd and type(server_config.cmd) == "table"

            if not valid_config then
                return false
            end

            local binary = server_config.cmd[1]

            return vim.fn.executable(binary) == 1
        end

        for name, opts in pairs(servers) do
            if lsp_binary_exists(vim.lsp.config[name]) then
                vim.lsp.config(name, opts)
                vim.lsp.enable(name)
            end
        end
    end,
}
