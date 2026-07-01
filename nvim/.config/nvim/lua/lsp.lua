--- Override default options for hover and signature help
local hover = vim.lsp.buf.hover
local signature_help = vim.lsp.buf.signature_help

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
    return hover({
        max_width = 100,
        max_height = 14,
    })
end

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
    return signature_help({
        max_width = 100,
        max_height = 14,
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
    jump = {
        on_jump = function(_, _)
            vim.diagnostic.open_float()
        end,
    },
    severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
            vim.keymap.set("n", "<leader>ih", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
            end, { desc = "Toggle inlay hints" })
        end

        if client:supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<leader>fs", vim.lsp.buf.format, { desc = "LSP format" })
        end

        if client:supports_method("textDocument/foldingRange") then
            local window = vim.api.nvim_get_current_win()
            vim.wo[window][0].foldmethod = "expr"
            vim.wo[window][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end

        if client:supports_method("textDocument/documentHighlight") then
            local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                group = highlight_group,
                buffer = ev.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                group = highlight_group,
                buffer = ev.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end

        vim.keymap.set("n", "grd", vim.diagnostic.open_float, { desc = "Diagnostic open float" })
    end,
})
