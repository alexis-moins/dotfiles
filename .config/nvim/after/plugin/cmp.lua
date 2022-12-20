local cmp = require('cmp')

vim.opt.completeopt = { 'menuone', 'noselect' }

cmp.setup({

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    experimental = {
        ghost_text = true
    },

    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),

        ['<C-n>'] = function()
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end,

        ['<C-y>'] = cmp.mapping.confirm({ select = true })
    },

    -- Where the cmp is taken from
    sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'path' },
    }, {
        { name = 'buffer', keyword_length = 2 },
    }),

    formatting = {
        format = function(entry, vim_item)
            local menu = {
                copilot = '[copilot]',
                nvim_lua = '[lua]',
                nvim_lsp = '[LSP]',
                luasnip = '[snippet]',
                buffer = '[buffer]',
                path = '[path]',
            }

            vim_item.menu = menu[entry.source.name]
            return vim_item

        end,
    },

})
