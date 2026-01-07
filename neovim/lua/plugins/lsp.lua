-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://namileriblog.com/mac/lazy_nvim_lsp/

local lsp_servers = {
    "bashls",
    "lua_ls",
    "eslint",
    "tsserver",
    "yamlls",
}

return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = lsp_servers,
            })
            for _, lsp_server in ipairs(lsp_servers) do
                vim.lsp.config(lsp_server, {
                    root_dir = function(fname)
                        local lspconfig_util = require("lspconfig.util")
                        if type(fname) == "number" then
                            fname = vim.api.nvim_buf_get_name(fname)
                        end
                        return lspconfig_util.find_git_ancestor(fname) or vim.fn.getcwd()
                    end,
                })
            end
        end,
    },
}

