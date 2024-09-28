vim.cmd([[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="IncSearch", timeout=50})]])
return {
    'folke/tokyonight.nvim',
    as ='tokyonight',
    config = function()
        vim.cmd[[colorscheme tokyonight-night]]
    end
}
