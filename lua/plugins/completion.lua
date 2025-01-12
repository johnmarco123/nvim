return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
              -- Set up nvim-cmp.
          local cmp = require('cmp')
          local cmp_select = {behaviour = cmp.SelectBehavior.Select}

          cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                 require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({select = true}),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'buffer' },
            }
            )
        })

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`,
          -- this won't work anymore).
          cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

          -- you can use echo &ft when using DBUI to see the filetype you need
          -- to add here for autcomplete to work
          cmp.setup.filetype({ "sql", "mysql" }, {
              sources = {
                  { name = "vim-dadbod-completion" },
                  { name = "buffer" },
              },
          })
      end
}
