local M = {}

M.setup = function()
    -- Increase font size
    vim.keymap.set("n", "+", function()
        local current_font = vim.opt.guifont
        local size = current_font:match('%d+$')
        if size then
            local new_size = tonumber(size) + 10
            local new_font = current_font:gsub('%d+$', new_size)
            vim.opt.guifont = new_font
        end
    end, { desc = "Increase font size" })

    -- Decrease font size
    vim.keymap.set("n", "-", function()
        local current_font = vim.opt.guifont
        local size = current_font:match('%d+$')
        if size then
            local new_size = tonumber(size) - 10
            if new_size > 0 then
                local new_font = current_font:gsub('%d+$', new_size)
                vim.opt.guifont = new_font
            end
        end
    end, { desc = "Decrease font size" })

    -- Reset font size
    vim.keymap.set("n", "0", function()
        local default_font = "PlemolJP35 Medium:h16.5"
        vim.opt.guifont = default_font
    end, { desc = "Reset font size" })
end

return M

