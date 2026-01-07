-- https://github.com/olimorris/codecompanion.nvim

return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "zbirenbaum/copilot.lua",
            "ravitemer/mcphub.nvim",
        },
        opts = {
            adapters = {
            },
            strategies = {
                chat = {
                    tools = {
                        ["mcp"] = {
                            -- 必要時に拡張をロードする（mcphub Wiki の推奨パターン）
                            callback = function()
                                return require("mcphub.extensions.codecompanion")
                            end,
                            description = "Call tools and resources from the MCP Servers",
                        },
                    },
                },
            },
            language = {
                "Japanese",
            },
            extensions = {
                mcphub = {
                    callback = "mcphub.extensions.codecompanion",
                    opts = {
                        -- MCP tools
                        make_tools = true,
                        show_server_tools_in_chat = true,
                        add_mcp_prefix_to_tool_names = false,
                        show_result_in_chat = true,
                        format_tool = nil,
                        -- MCP resources
                        make_vars = true,
                        -- MCP prompts
                        make_slash_commands = true,
                    },
                },
            }
        },
    },
}

