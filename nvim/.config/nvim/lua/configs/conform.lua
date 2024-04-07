local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		markdown = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "prettier" },
		graphql = { "prettier" },
		scss = { "prettier" },
		less = { "prettier" },
		vue = { "prettier" },
	},
}

require("conform").setup(options)
