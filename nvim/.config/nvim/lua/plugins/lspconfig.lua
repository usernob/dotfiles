return {
	"neovim/nvim-lspconfig",
	event = "BufRead",
	config = function()
		local M = {}

		local lspconfig = require("lspconfig")

		--- @type table<string, lspconfig.Config>
		local servers = {
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

		M.lsp_binary_exists = function(server_config)
			local valid_config = server_config.config_def
				and server_config.config_def.default_config
				and type(server_config.config_def.default_config.cmd) == "table"
				and #server_config.config_def.default_config.cmd >= 1

			if not valid_config then
				return false
			end

			local binary = server_config.document_config.default_config.cmd[1]

			return vim.fn.executable(binary) == 1
		end

		for name, opts in pairs(servers) do
			if lspconfig[name] and lspconfig[name].setup and M.lsp_binary_exists(lspconfig[name]) then
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
				opts.capabilities = vim.tbl_deep_extend("keep", opts.capabilities, M.capabilities)

				lspconfig[name].setup(opts)
			end
		end
	end,
}
