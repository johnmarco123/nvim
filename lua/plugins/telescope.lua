local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules",
        }
    }
}

---- NEEDED FOR HARPOON SETUP
--local harpoon = require('harpoon')
--harpoon:setup({})
--
---- basic telescope configuration
--local conf = require("telescope.config").values
--local function toggle_telescope(harpoon_files)
--    local file_paths = {}
--    for _, item in ipairs(harpoon_files.items) do
--        table.insert(file_paths, item.value)
--    end
--
--    require("telescope.pickers").new({}, {
--        prompt_title = "Harpoon",
--        finder = require("telescope.finders").new_table({
--            results = file_paths,
--        }),
--        previewer = conf.file_previewer({}),
--        sorter = conf.generic_sorter({}),
--    }):find()
--end
--
-- THIS MUST BE DIFF THEN REGULAR SHow harpoon list, otherwise you cannot
-- delete files added to harpoon
--vim.keymap.set("n", "<C-p>", function() toggle_telescope(harpoon:list()) end,
--    { desc = "Open harpoon window" })

return { 'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} }
}
