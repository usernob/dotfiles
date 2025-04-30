local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("QuitPre", {
    callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(tree_wins, w)
            end
            if vim.api.nvim_win_get_config(w).relative ~= "" then
                table.insert(floating_wins, w)
            end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(tree_wins) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end,
})

-- listen lsp-progress event and refresh lualine
augroup("lualine_augroup", { clear = true })
autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = function()
        vim.cmd("redrawstatus")
    end,
})

local file_load_time = augroup("file_load_time", { clear = true })
autocmd("BufReadPre", {
    group = file_load_time,
    pattern = "*",
    callback = function(arg)
        vim.b[arg.buf].load_time = vim.uv.hrtime()
    end,
})

autocmd("BufRead", {
    group = file_load_time,
    pattern = "*",
    callback = function(arg)
        if not vim.b[arg.buf].load_time then
            return
        end

        vim.b[arg.buf].load_time = (vim.uv.hrtime() - vim.b[arg.buf].load_time) / 1e6
    end,
})
