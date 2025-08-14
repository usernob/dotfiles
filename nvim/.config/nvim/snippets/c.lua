local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function include_guard()
    local full_path = vim.fn.expand("%")
    local relative_path = vim.fn.fnamemodify(full_path, ":~:.:h")
    local filename = vim.fn.fnamemodify(full_path, ":t")
    local result_raw = ""
    local prefix_path = ""

    if relative_path ~= "." then
        local splitted_path = vim.split(relative_path, "/")
        prefix_path = table.concat(splitted_path, "_")
        result_raw = prefix_path .. "_" .. filename
    else
        result_raw = filename
    end

    local sanitized = result_raw:gsub("[^%w]", "_")
    return string.upper(sanitized)
end

return {
    s("guard", {
        t("#ifndef "),
        f(include_guard, {}),
        t({ "", "#define " }),
        f(include_guard, {}),
        t({ "", "", "" }),
        i(0),
        t({ "", "", "#endif // " }),
        f(include_guard, {}),
    }),
}
