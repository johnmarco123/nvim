return { 'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({ no_ignore = true })
        end)
        vim.keymap.set('n', '<C-p>', function()
            builtin.git_files ({ no_ignore = true })
        end)
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word });
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word, no_ignore = true});
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > "), no_ignore = true });
        end)
        require('telescope').setup{
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                }
            }
        }
    end
}
