-- https://neovide.dev/configuration.html

if vim.g.neovide then
    -- Set GUI font
    if vim.fn.has('win64') then
        vim.opt.guifont = "PlemolJP35 Console NF:h16.5"
    else
        vim.opt.guifont = "PlemolJP35 Medium:h16.5"
    end

    -- Hidden GUI parts
    vim.cmd([[
        " Hidden menubar and toolbar
        set guioptions-=T
        set guioptions-=m

        " Hidden scroll bar on the left and right
        set guioptions-=r
        set guioptions-=R
        set guioptions-=l
        set guioptions-=L

        " Hidden horizontal scroll bar
        set guioptions-=b
    ]])

    -- Transparency
    vim.g.neovide_transparency = 0.9

    -- Replace yen sign with backslash
    vim.keymap.set('i', '¥', '\\')
    vim.keymap.set('c', '¥', '\\')
    vim.keymap.set('n', '¥', '\\')
end

