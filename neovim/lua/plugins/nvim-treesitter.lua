-- https://github.com/nvim-treesitter/nvim-treesitter

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = "all",
        },
    },
}

