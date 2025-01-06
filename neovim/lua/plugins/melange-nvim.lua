-- https://github.com/savq/melange-nvim

return {
    {
        "savq/melange-nvim",
        config = function()
            vim.opt.termguicolors = true
            vim.cmd.colorscheme('melange')
        end,
    },
}

