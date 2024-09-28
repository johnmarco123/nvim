--local lsp = require('lsp-zero')

-- this little shit broke the gi command!
--lsp.preset('recommended')
--lsp.ensure_installed({
--	'lua_ls',
--    'ts_ls'
--})
--local cmp = require('cmp')
--local cmp_select = {behaviour = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({select = true}),
--	['<C-Space>'] = cmp.mapping.complete(),
--})
--
--cmp.setup.filetype({"sql"}, {
--    sources = {
--        {name = "vim-dadbod-completion"},
--        {name = "buffer"},
--    },
--})

--lsp.set_preferences({
--	sign_icons = { }
--})
--
--lsp.on_attach(function(client, bufnr)
--	local opts = {buffer = bufnr, remap = false}
--
--	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
--	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
--	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--	-- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--end)

--lsp.setup({
--    rust_analyzer = {
--        cmd = { "rust_analyzer" },
--        filetypes = { "rust" },
--    },
--})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- configure manual  autocompletion
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- tab completion
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    })
})

-- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"sql", "mysql", "plsql"},
    callback = function()
        cmp.setup.buffer {
            sources = {
                { name = 'vim-dadbod-completion' }
            }
        }
    end,
})
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
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
