-- https://github.com/glacambre/firenvim

return {
    {
        "glacambre/firenvim",
        build = ":call firenvim#install(0)",
        config = function()
            vim.g.firenvim_config = {
                globalSettings = {},
                localSettings = {
                    [".*"] = {
                        selector = "",
                        priority = 0,
                    },
                    ["github.com"] = {
                        selector = "textarea",
                        priority = 1,
                    },
                },
            }
        end,
    },
}

