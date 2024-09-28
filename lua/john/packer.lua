-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use('nvim-lua/plenary.nvim')
    use {
        'nvim-telescope/telescope.nvim',
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
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
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
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- math linter
    --use('jbyuki/nabla.nvim')
    -- note taking
    use('vimwiki/vimwiki')
    use('simrat39/rust-tools.nvim')

    use('tpope/vim-dadbod')
    use('kristijanhusak/vim-dadbod-completion')
    use('kristijanhusak/vim-dadbod-ui')
    -- Debugging
    --use('mfussenegger/nvim-dap')
    --use('folke/zen-mode.nvim')

    --use('ggandor/leap.nvim')
    --use({
        --    "stevearc/oil.nvim",
        --    config = function()
            --        require("oil").setup()
            --    end,
            --})
        end)
