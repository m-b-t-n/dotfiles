-- https://github.com/nvim-neotest/neotest
-- https://github.com/thenbe/neotest-playwright

return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "antoinemadec/FixCursorHold.nvim",
            "thenbe/neotest-playwright",
        },
        lazy = true,
        cmd = {
            "Neotest",
            "NeotestPlaywrightPreset",
            "NeotestPlaywrightProject",
            "NeotestPlaywrightRefresh",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-playwright").adapter({
                        options = {
                            persist_project_selection = true,
                            enable_dynamic_test_discovery = true,
                        },
                    }),
                },
            })
        end,
    },
}

