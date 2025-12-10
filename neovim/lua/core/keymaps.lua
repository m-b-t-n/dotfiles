local M = {}

M.setup = function()
    -- Increase font size
    vim.keymap.set("n", "+", function()
        local current_font = vim.api.nvim_get_option("guifont")
        if current_font and current_font ~= "" then
            local font_name, size = current_font:match("(.+):h(%d+%.?%d*)")
            if font_name and size then
                local new_size = tonumber(size) + 2
                vim.opt.guifont = font_name .. ":h" .. new_size
            end
        end
    end, { desc = "Increase font size" })

    -- Decrease font size
    vim.keymap.set("n", "-", function()
        local current_font = vim.api.nvim_get_option("guifont")
        if current_font and current_font ~= "" then
            local font_name, size = current_font:match("(.+):h(%d+%.?%d*)")
            if font_name and size then
                local new_size = tonumber(size) - 2
                if new_size > 0 then
                    vim.opt.guifont = font_name .. ":h" .. new_size
                end
            end
        end
    end, { desc = "Decrease font size" })

    -- Reset font size
    vim.keymap.set("n", "=", function()
        local default_font = "PlemolJP35 Medium:h16.5"
        vim.opt.guifont = default_font
    end, { desc = "Reset font size" })

    -- Abbreviate :CodeCompanion
    vim.cmd([[cab cc CodeCompanion]])
end

return M

