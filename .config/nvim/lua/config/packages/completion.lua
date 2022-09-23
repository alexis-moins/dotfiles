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
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },

    -- Where the cmp is taken from
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 2 },
        { name = 'path' },
    }),

    formatting = {
        format = function(entry, vim_item)
            local menu = {
                nvim_lua = '[lua]',
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
