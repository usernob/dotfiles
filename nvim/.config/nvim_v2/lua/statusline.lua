local sep_l = "█"
local sep_r = "%#St_sep_r#" .. "█" .. " %#St_EmptySpace#"
local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
	return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
end

---@type NvStatusLineConfig
local M = {
	theme = "minimal",
	order = {
		"mode",
		"file",
		"git",
		"%=",
		"lsp_msg",
		"%=",
		"diagnostics",
		"lsp",
		"recording_mode",
		"filetype",
		"codeium",
		"ext_cursor",
	},

	modules = {
		recording_mode = function()
			local ok, noice = pcall(require, "noice")
			if not ok then
				return ""
			end

			if not noice.api.status.mode.has() then
				return ""
			end

			return "%#St_file_txt# " .. noice.api.status.mode.get() .. " "
		end,

		filetype = function()
			return gen_block("", vim.bo.filetype, "%#St_cwd_sep#", "%#St_cwd_bg#", "%#St_cwd_txt#")
		end,

		codeium = function()
			local ok, status = pcall(vim.call, "codeium#GetStatusString")
			if not ok then
				status = "OFF"
			end
			local icon = "󰚩"
			if status == "OFF" then
				icon = "󱚧"
			end
			return gen_block(icon, status, "%#St_Codeium_sep#", "%#St_Codeium_bg#", "%#St_Codeium_txt#")
		end,

		ext_cursor = function()
			return gen_block("", "%l/%L:%c", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
		end,
	},
}

return M
