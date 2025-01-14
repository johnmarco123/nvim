return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "tpope/vim-dadbod",
            "vim-dadbod-completion",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "intelephense",
                },
                handlers = {
                    function (server_name)
                        require("lspconfig")[server_name].setup { }
                    end,
                    ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    globals = { "vim" }
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),  -- Load all Neovim's runtime files
                                },
                            }
                        }
                    }
                end
                }
            })
        end
    },
}-- so many curly brackets dear god...
