return {
	"neovim/nvim-lspconfig",
	config = function()
		require("nvchad.configs.lspconfig").defaults()
		local configs = require("nvchad.configs.lspconfig")

		local lspconfig = require("lspconfig")

		local installed_servers = require("mason-lspconfig").get_installed_servers()

		if vim.fn.expand("%:e") == "lua" then
			require("neodev").setup()
		end

		--- @type table<string, lspconfig.Config>
		local servers = {
			tsserver = {
				filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
				---@diagnostic disable-next-line: assign-type-mismatch
				root_dir = lspconfig.util.root_pattern(
					"package.json",
					"tsconfig.json",
					"jsconfig.json",
					"node_modules"
				),
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
							library = {
								vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
							},
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
		}

		for _, server in ipairs(installed_servers) do
			servers[server] = servers[server] or {}
		end

		configs.capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		for name, opts in pairs(servers) do
			-- opts.on_init = configs.on_init

			opts.on_attach = function(client, bufnr)
				configs.on_attach(client, bufnr)

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

				local navic_ok, navic = pcall(require, "nvim-navic")
				if not navic_ok then
					return
				end

				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end

			opts.capabilities = configs.capabilities

			require("lspconfig")[name].setup(opts)
		end
	end,
}
