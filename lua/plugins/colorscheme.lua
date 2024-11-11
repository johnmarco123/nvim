return {
    {
    'folke/tokyonight.nvim',
    config = function()
        vim.cmd('colorscheme tokyonight-night');
        vim.cmd([[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="IncSearch", timeout=50})]]);
        vim.api.nvim_set_hl(0, "IncSearch", {bg="#FF8C00"}) -- changes the yank color
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
        vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
    end
    }
    --{
    --    'rose-pine/neovim',
    --    name ='rose-pine',
    --    config = function()
    --        vim.cmd('colorscheme rose-pine');
    --        vim.cmd([[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="IncSearch", timeout=50})]]);
    --    end

    --},
}
