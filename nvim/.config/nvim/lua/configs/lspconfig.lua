local configs = require("nvchad.configs.lspconfig")

local lspconfig = require("lspconfig")

require("neodev").setup()

local servers = {
	html = {},

	tsserver = {
		filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", "node_modules"),
	},
	rust_analyzer = {
		filetypes = { "rust" },
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
			},
		},
	},
}

for name, opts in pairs(servers) do
	opts.on_init = configs.on_init
	opts.on_attach = configs.on_attach
	opts.capabilities = configs.capabilities

	require("lspconfig")[name].setup(opts)
end
