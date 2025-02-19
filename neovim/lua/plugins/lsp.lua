-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://namileriblog.com/mac/lazy_nvim_lsp/

local lsp_servers = {
    "bashls",
    "lua_ls",
}

return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = lsp_servers,
            })
            local lsp_config = require("lspconfig")
            for _, lsp_server in ipairs(lsp_servers) do
                lsp_config[lsp_server].setup({
                    root_dir = function(fname)
                        return lsp_config.util.find_git_ancestor(fname) or vim.fn.getcwd()
                    end,
                })
            end
        end,
    },
}

