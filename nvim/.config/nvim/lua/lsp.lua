--- Override default options for hover and signature help
local hover = vim.lsp.buf.hover
local signature_help = vim.lsp.buf.signature_help

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
    return hover({
        max_width = 100,
        max_height = 14,
        border = "rounded",
    })
end

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
    return signature_help({
        max_width = 100,
        max_height = 14,
        border = "rounded",
    })
end

vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
    },
    float = {
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅙",
            [vim.diagnostic.severity.INFO] = "󰋼",
            [vim.diagnostic.severity.HINT] = "󰌵",
            [vim.diagnostic.severity.WARN] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticLineHlError",
            [vim.diagnostic.severity.INFO] = "DiagnosticLineHlInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticLineHlHint",
            [vim.diagnostic.severity.WARN] = "DiagnosticLineHlWarn",
        },
    },
    severity_sort = true,
})

local setupInlayHint = function()
    vim.lsp.inlay_hint.enable(true)
    vim.keymap.set("n", "<leader>ih", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end, { desc = "Toggle inlay hints" })
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        if client.server_capabilities.inlayHintProvider then
            setupInlayHint()
        end

        if client:supports_method("textDocument/foldingRange") then
            local window = vim.api.nvim_get_current_win()
            vim.wo[window][0].foldmethod = "expr"
            vim.wo[window][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end

        vim.keymap.set("n", "grd", vim.diagnostic.open_float, { desc = "Diagnostic open float" })
    end,
})
