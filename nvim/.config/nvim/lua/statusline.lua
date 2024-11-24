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

	local max_len = 50

	local fullpath = vim.api.nvim_buf_get_name(J.bufnr())
	if fullpath:sub(1, 6) == "oil://" then
		return "oil.nvim"
	end

	local filename = vim.fn.fnamemodify(fullpath, ":t")
	if devicons_ok then
		local ext = vim.fn.fnamemodify(fullpath, ":e")

		if fullpath:sub(1, 6) == "man://" then
			ext = "man"
		end

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
		local max_len_perpath = math.floor(max_len / (#splitted_path + 1))

		for key, value in pairs(splitted_path) do
			if #value > max_len_perpath + 3 then
				value = value:sub(1, max_len_perpath - 3) .. "..."
			end
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
		require("lsp-progress").progress(),
		"%y",
		"%L" .. highlights("St_Normal2", "L"),
		J.ruler(),
		" ",
	}, " ")
end
