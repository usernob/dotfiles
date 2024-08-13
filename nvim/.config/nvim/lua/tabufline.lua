return {
	order = { "nvim_tree", "label", "buffers", "tabs" },
	enabled = true,
	modules = {
		label = function()
			return "%#TbCloseAllBufsBtn# buffers "
			--- HACK: actually i am bored write new highlights so i just use this
		end,
		nvim_tree = function()
			for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
				if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
					local width = vim.api.nvim_win_get_width(win) - 5
					local offset = string.rep(" ", width)
					return "%#TbCloseAllBufsBtn# tree %#NvimTreeNormal#" .. offset
				end
			end
			return ""
		end,
	},
}
