-- Configuring cmp
local cmp = require('cmp')

cmp.setup({

    -- Integrating snippet engine
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    -- Mappings
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-x>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), 
    },

    -- Where the cmp is taken from
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
    }),

    formatting = {
        format = function(entry, vim_item)
            local menu = {
                nvim_lua = '[api]',
                nvim_lsp = '[LSP]',
                luasnip = '[snippet]',
                buffer = '[buffer]',
                path = '[path]',
            }

            vim_item.menu = menu[entry.source.name]
            return vim_item
        end
    }

})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' } 
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' } }, {
            { name = 'cmdline' }
        })
    })
