return {
    'vimwiki/vimwiki',
    config = function()
        -- wiki good toggles checkbox
        vim.keymap.set("n", "<leader>wg", ":VimwikiToggleListItem<CR>");
        -- wiki find
        vim.keymap.set("n", "<leader>wf", ":edit ~/vimwiki/index.wiki <CR> | :VimwikiSearch ");
        vim.keymap.set("n", "<F10>", ":lnext<CR>");
        vim.keymap.set("n", "<F9>", ":lprev<CR>");
    end
}
