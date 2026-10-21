return {
    {
        "reireias/vim-cheatsheet",
        lazy = true,
        cmd = {
            "Cheat",
        },
        config = function()
            vim.g['cheatsheet#cheat_file'] = '$HOME/dotfiles/neovim/docs/cheatsheet.md'
            vim.g['cheatsheet#float_window'] = 1
        end,
    },
}
