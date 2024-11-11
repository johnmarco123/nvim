return {
    globals = {'vim'},
    'nvim-lua/plenary.nvim',
    'mbbill/undotree',
    'Eandrju/cellular-automaton.nvim',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    --'jbyuki/nabla.nvim' -- math linter
    -- note taking
    -- 'simrat39/rust-tools.nvim',
    -- Debugging
    --'mfussenegger/nvim-dap' <-- from prabs phpstorm
    --'folke/zen-mode.nvim'
    --'ggandor/leap.nvim'
    --({
    --    "stevearc/oil.nvim",
    --    config = function()
    --    require("oil").setup()
    --    end,
    --}),
}
