--
-- extends defaults nvchd cmp config to support cmp-cmdline
--
return {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	dependencies = {
		"hrsh7th/cmp-cmdline",
	},
	config = function(_, opts)
		local cmp = require("cmp")

		local sources = {
			{
				name = "lazydev",
				group_index = 0,
			},
		}

		table.insert(opts.sources, sources)

		cmp.setup(opts)

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline", option = { ignore_cmds = { "!", "w", "q", "wq" } } },
			}),
		})
	end,
}
