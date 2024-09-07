-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
            use({
                'folke/tokyonight.nvim',
                as ='tokyonight',
                config = function()
                    vim.cmd[[colorscheme tokyonight-night]]
                end
            })

            use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
            use('nvim-treesitter/playground')
            use('theprimeagen/harpoon')
            use('mbbill/undotree')
            use('tpope/vim-fugitive')
            use('ThePrimeagen/vim-be-good')
            use {
                'VonHeikemen/lsp-zero.nvim',
                branch = 'v2.x',
                requires = {
                    -- LSP Support
                    {'neovim/nvim-lspconfig'},             -- Required
                    {                                      -- Optional
                    'williamboman/mason.nvim',
                    run = function()
                        pcall(vim.cmd, 'MasonUpdate')
                    end,
                },
                {'williamboman/mason-lspconfig.nvim'}, -- Optional

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},     -- Required
                {'hrsh7th/cmp-nvim-lsp'}, -- Required
                {'L3MON4D3/LuaSnip'},     -- Required
            }
        }
        -- use {
        --     'numToStr/Comment.nvim',
        --     config = function()
        --         require('Comment').setup()
        --     end
        -- }
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }
        -- math linter
        use('jbyuki/nabla.nvim')
        -- note taking
        use('vimwiki/vimwiki')
        use('neovim/nvim-lspconfig')
        use('simrat39/rust-tools.nvim')
        -- Debugging
        use('nvim-lua/plenary.nvim')
        use('mfussenegger/nvim-dap')
        use('folke/zen-mode.nvim')
        use('github/copilot.vim')
        use('xiyaowong/transparent.nvim')
        use({
            "stevearc/oil.nvim",
            config = function()
                require("oil").setup()
            end,
        })
    end)
