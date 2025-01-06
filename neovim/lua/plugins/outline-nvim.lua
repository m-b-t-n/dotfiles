-- https://github.com/hedyhli/outline.nvim

return {
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = {
            "Outline",
            "OutlieOpen",
        },
        keys = {
            { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle outline" },
        },
        opts = {
        },
    },
}

