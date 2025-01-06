-- https://github.com/previm/previm/

return {
    {
        "previm/previm",
        lazy = true,
        ft = {
            "markdown",
        },
        config = function()
            vim.g.previm_enable_realtime = 1
            if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
                vim.g.previm_open_cmd = 'C:\\Program Files (x86)\\Mozilla Firefox\\firefox.exe'
            elseif vim.fn.has('mac') == 1 then
                vim.g.previm_open_cmd = 'open -a Firefox.app'
            elseif vim.fn.has('linux') == 1 then
                vim.g.previm_open_cmd = '' -- TBW
            end
        end,
        keys = {
            { "<C-p>", "<cmd>PrevimOpen<cr>", desc = "Preview Markdown" },
        },
    },
}

