-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
-- https://qiita.com/haw_ohnuma/items/1ec8ef5091b440cbb8bd#copilotchatnvim

return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            "zbirenbaum/copilot.lua",
            {
                "nvim-lua/plenary.nvim",
                branch = "master",
            },
        },
        lazy = true,
        cmd = {
            "CopilotChat",
            "CopilotChatFix",
            "CopilotChatDocs",
            "CopilotChatOpen",
            "CopilotChatClose",
            "CopilotChatReset",
            "CopilotChatTests",
            "CopilotChatToggle",
            "CopilotChatExplain",
        },
        build = "make tiktoken",
        opts = {
            show_help = "yes",
            model = "auto",
            prompts = {
                Explain = {
                    prompt = "/COPILOT_EXPLAIN #buffer のコードを日本語で説明してください",
                    mapping = "<leader>ce",
                    description = "コードの説明をお願いする",
                },
                Review = {
                    prompt = "/COPILOT_REVIEW #buffer のコードを日本語でレビューしてください",
                    mapping = "<leader>cr",
                    description = "コードのレビューをお願いする",
                },
                Fix = {
                    prompt = "/COPILOT_FIX #buffer のコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします",
                    mapping = "<leader>cf",
                    description = "コードの修正をお願いする",
                },
                Optimize = {
                    prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします",
                    mapping = "<leader>co",
                    description = "コードの最適化をお願いする",
                },
                Docs = {
                    prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください",
                    mapping = "<leader>cd",
                    description = "コードのドキュメント作成をお願いする",
                },
                Tests = {
                    prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします",
                    mapping = "<leader>ct",
                    description = "テストコード作成をお願いする",
                },
            },
        },
    }
}

