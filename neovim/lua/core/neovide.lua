-- https://neovide.dev/configuration.html

if vim.g.neovide then
    -- Set GUI font
    vim.opt.guifont = "PlemolJP35 Medium:h16.5"

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
end

