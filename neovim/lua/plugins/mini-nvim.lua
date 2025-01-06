-- https://github.com/echasnovski/mini.nvim

return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function(_, opts)
            require("mini.ai").setup()
            require("mini.comment").setup()
            require("mini.diff").setup()
            require("mini.git").setup()

            --[[
            function statusline_set_config()
                local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                local git = MiniStatusline.section_git({ trunc_width = 75 })
                local filename = MiniStatusline.section_filename({ trunc_width = 140 })
                local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                local location = MiniStatusline.section_location({ trunc_width = 75 })

                return MiniStatusline.combine_groups({
                    { hl = mode_hl, strings = { mode } },
                    '%<', -- Mark general truncate point
                    { hl = "MiniStatuslineFilename" , strings = { filename } },
                    '%=', -- End left alignment
                    { hl = "MiniStatuslineDevinfo", strings = { git } },
                    { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                    { hl = "MiniStatuslineDevinfo", strings = { location } },
                })
            end

            require("mini.statusline").setup({
                content = {
                    active = statusline_set_config,
                },
            })
            ]]--
        end,
    },
}

