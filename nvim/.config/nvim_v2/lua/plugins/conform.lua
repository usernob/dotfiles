return {
	"stevearc/conform.nvim",
	cond = false,
	opts = {
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
			svelte = { "prettier" },
			astro = { "prettier" },
			cpp = { "clang-format" },
			c = { "clang-format" },
		},
	},
	keys = {
		{
			"<leader>fm",
			"<CMD>lua require('conform').format({ async = true })<CR>",
			desc = "File Format with conform",
		},
	},
}
