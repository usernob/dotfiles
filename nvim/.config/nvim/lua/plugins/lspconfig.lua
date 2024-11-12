return {
	"neovim/nvim-lspconfig",
	event = "BufRead",
	config = function()
		local M = {}

		local lspconfig = require("lspconfig")

		local installed_servers = require("mason-lspconfig").get_installed_servers()

		--- @type table<string, lspconfig.Config>
		local servers = {
			-- ts_ls = {
			-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
			-- 	---@diagnostic disable-next-line: assign-type-mismatch
			-- 	root_dir = lspconfig.util.root_pattern(
			-- 		"package.json",
			-- 		"tsconfig.json",
			-- 		"jsconfig.json",
			-- 		"node_modules"
			-- 	),
			-- },
			denols = {
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.lock"),
			},
			biome = {
				root_dir = lspconfig.util.root_pattern("package.json"),
			},
			rust_analyzer = {
				filetypes = { "rust" },
				---@diagnostic disable-next-line: assign-type-mismatch
				root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
			},
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
			},
			tailwindcss = {},
		}

		for _, server in ipairs(installed_servers) do
			if server == "tsserver" then
				server = "ts_ls"
			end
			servers[server] = servers[server] or {}
		end

		--- @param client vim.lsp.Client
		--- @param bufnr integer
		M.on_attach = function(client, bufnr)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true)
			end

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅙",
						[vim.diagnostic.severity.INFO] = "󰋼",
						[vim.diagnostic.severity.HINT] = "󰌵",
						[vim.diagnostic.severity.WARN] = "",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
						[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
						[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
						[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					},
					linehl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticLineHlError",
						[vim.diagnostic.severity.INFO] = "DiagnosticLineHlInfo",
						[vim.diagnostic.severity.HINT] = "DiagnosticLineHlHint",
						[vim.diagnostic.severity.WARN] = "DiagnosticLineHlWarn",
					},
				},
				severity_sort = true,
			})

			vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "Lsp code action" })
			vim.keymap.set("n", "grr", vim.lsp.buf.rename, { desc = "Lsp rename" })
		end

		M.capabilities = vim.lsp.protocol.make_client_capabilities()

		M.capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		M.capabilities.textDocument.completion.completionItem = {
			documentationFormat = { "markdown", "plaintext" },
			snippetSupport = true,
			preselectSupport = true,
			insertReplaceSupport = true,
			labelDetailsSupport = true,
			deprecatedSupport = true,
			commitCharactersSupport = true,
			tagSupport = { valueSet = { 1 } },
			resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			},
		}

		--- @param client vim.lsp.Client
		M.on_init = function(client, _)
			-- if client.supports_method("textDocument/semanticTokens") then
			-- 	client.server_capabilities.semanticTokensProvider = nil
			-- end
		end

		for name, opts in pairs(servers) do
			opts.on_init = M.on_init

			opts.on_attach = M.on_attach

			opts.handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "rounded",
					max_width = 100,
					max_height = 30,
				}),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
					border = "rounded",
				}),
			}
			-- opts.capabilities = M.capabilities
			opts.capabilities = opts.capabilities or {}
			opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities, M.capabilities)

			require("lspconfig")[name].setup(opts)
		end
	end,
}
