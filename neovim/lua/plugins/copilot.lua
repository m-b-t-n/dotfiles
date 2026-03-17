-- https://github.com/zbirenbaum/copilot.lua

return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        opts = {
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<M-l>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
        },
    },
}

