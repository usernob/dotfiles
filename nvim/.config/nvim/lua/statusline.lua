-- local sep_l = "█"
-- local sep_r = "%#St_sep_r#" .. "█" .. " %#St_EmptySpace#"
-- local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
-- 	return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
-- end
--
-- ---@type NvStatusLineConfig
-- local M = {
-- 	theme = "minimal",
-- 	order = {
-- 		"mode",
-- 		"file",
-- 		"git",
-- 		"%=",
-- 		"lsp_msg",
-- 		"%=",
-- 		"diagnostics",
-- 		"lsp",
-- 		"recording_mode",
-- 		"filetype",
-- 		"codeium",
-- 		"ext_cursor",
-- 	},
--
-- 	modules = {
-- 		recording_mode = function()
-- 			local ok, noice = pcall(require, "noice")
-- 			if not ok then
-- 				return ""
-- 			end
--
-- 			if not noice.api.status.mode.has() then
-- 				return ""
-- 			end
--
-- 			return "%#St_file_txt# " .. noice.api.status.mode.get() .. " "
-- 		end,
--
-- 		filetype = function()
-- 			return gen_block("", vim.bo.filetype, "%#St_cwd_sep#", "%#St_cwd_bg#", "%#St_cwd_txt#")
-- 		end,
--
-- 		codeium = function()
-- 			local ok, status = pcall(vim.call, "codeium#GetStatusString")
-- 			if not ok then
-- 				status = "OFF"
-- 			end
-- 			local icon = "󰚩"
-- 			if status == "OFF" then
-- 				icon = "󱚧"
-- 			end
-- 			return gen_block(icon, status, "%#St_Codeium_sep#", "%#St_Codeium_bg#", "%#St_Codeium_txt#")
-- 		end,
--
-- 		ext_cursor = function()
-- 			return gen_block("", "%l/%L:%c", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
-- 		end,
-- 	},
-- }
--

---set highlight group for content
---@param hl_start string
---@param content string | integer
---@param hl_end string?
---@return string
local function highlights(hl_start, content, hl_end)
	if not hl_end then
		hl_end = "St_Normal"
	end
	return "%#" .. hl_start .. "#" .. content .. "%#" .. hl_end .. "#"
end

local J = {}

J.bufnr = function()
	return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

J.filepath = function()
	local devicons_ok, devicons = pcall(require, "nvim-web-devicons")

	local fullpath = vim.api.nvim_buf_get_name(J.bufnr())
	if fullpath:sub(1, 6) == "oil://" then
		return "oil.nvim"
	end

	local filename = vim.fn.fnamemodify(fullpath, ":t")
	if devicons_ok then
		local ext = vim.fn.fnamemodify(fullpath, ":e")
		local icon, color = devicons.get_icon_color(filename, ext, { strict = true, default = true })

		local highlight_group = "St_DevIcon" .. ext
		vim.api.nvim_set_hl(
			0,
			highlight_group,
			{ fg = color, bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("StatusLine")), "bg") }
		)

		filename = highlights(highlight_group, icon) .. " " .. filename
	end

	local path = vim.fn.fnamemodify(fullpath, ":~:.:h")

	local prefix_path = ""
	if path ~= "." then
		local splitted_path = vim.split(path, "/")
		for key, value in pairs(splitted_path) do
			splitted_path[key] = highlights("St_Normal2", value)
		end
		prefix_path = table.concat(splitted_path, " / ") .. " / "
	end

	return prefix_path .. filename
end

J.diagnostics = function()
	local err = #vim.diagnostic.get(J.bufnr(), { severity = vim.diagnostic.severity.ERROR })
	local warn = #vim.diagnostic.get(J.bufnr(), { severity = vim.diagnostic.severity.WARN })
	local hints = #vim.diagnostic.get(J.bufnr(), { severity = vim.diagnostic.severity.HINT })
	local info = #vim.diagnostic.get(J.bufnr(), { severity = vim.diagnostic.severity.INFO })

	local str_err = (err and err > 0) and highlights("DiagnosticError", " " .. err .. " ") or ""
	local str_warn = (warn and warn > 0) and highlights("DiagnosticWarn", " " .. warn .. " ") or ""
	local str_hints = (hints and hints > 0) and highlights("DiagnosticHints", "󰛩 " .. hints .. " ") or ""
	local str_info = (info and info > 0) and highlights("DiagnosticInfo", "󰋼 " .. info .. " ") or ""

	return str_err .. str_warn .. str_hints .. str_info
end

J.ruler = function()
	return highlights("St_Normal2", "Ln ") .. "%l" .. highlights("St_Normal2", " Col ") .. "%c"
end

return function()
	return table.concat({
		" ",
		J.filepath(),
		"%m%r",
		J.diagnostics(),
		"%=",
		-- J.lsp_progress(),
		require("lsp-progress").progress(),
		"%y",
		"%L" .. highlights("St_Normal2", "L"),
		J.ruler(),
		" ",
	}, " ")
end
