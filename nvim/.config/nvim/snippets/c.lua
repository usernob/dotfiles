local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function guard_name()
    local filename = vim.fn.expand("%") -- nama file tanpa ekstensi
    local project = vim.fn.fnamemodify(filename, ":h") -- nama folder kerja
    local t_raw = {}
    if #project > 0 then
        table.insert(t_raw, project)
        table.insert(t_raw, "_")
    end
    table.insert(t_raw, vim.fn.fnamemodify(filename, ":t"))
    local raw = table.concat(t_raw, "")
    local sanitized = raw:gsub("[^%w]", "_")
    return string.upper(sanitized)
end

return {
    s("guard", {
        t("#ifndef "),
        f(guard_name, {}),
        t({ "", "#define " }),
        f(guard_name, {}),
        t({ "", "", "" }), -- Tambahin spasi 1 baris
        i(0), -- Ini tempat cursor akan jatuh (field 0 = akhir snippet)
        t({ "", "", "#endif // " }),
        f(guard_name, {}),
    }),
}
