local M = {}

M.setup = function()
    -- Update quickfix list automatically
    vim.api.nvim_create_autocmd("DiagnosticChanged", {
        callback = function()
            vim.diagnostic.setqflist({ open = false })
        end,
    })
end

