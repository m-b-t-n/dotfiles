-- https://github.com/ravitemer/mcphub.nvim

return {
    {
        'ravitemer/mcphub.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        build = "npm install -g mcp-hub@latest",
        config = function()
            -- Force using ascil_border for nui popup
            local Popup = require("nui.popup")
            local ascil_border = {
                top = "-",
                bottom = "-",
                left = "|",
                right = "|",
                top_left = "+",
                top_right = "+",
                bottom_left = "+",
                bottom_right = "+",
            }

            local OriginialPopupCtor = Popup
            local WrappedPopupCtor = function(opts)
                opts = opts or {}
                opts.border = opts.border or {}
                opts.border.style = ascil_border
                return OriginialPopupCtor(opts)
            end
            package.loaded["nui.popup"] = WrappedPopupCtor

            require("mcphub").setup()
        end,
    },
}

