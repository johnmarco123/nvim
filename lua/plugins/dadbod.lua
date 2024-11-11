return {
    'tpope/vim-dadbod', lazy = true,
    dependencies = {
        'kristijanhusak/vim-dadbod-ui',
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    -- NO FOLDS!
    config = function()
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'dbout' },
            callback = function()
                vim.opt.foldenable = false
            end,
        })
    end,
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
    end,
}
