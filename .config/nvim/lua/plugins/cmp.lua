return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',

    dependencies = {
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lua',

        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',

        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },

    config = function()
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

            -- window = {
            --     completion = cmp.config.window.bordered(),
            --     documentation = cmp.config.window.bordered(),
            -- },

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

            sources = cmp.config.sources({
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
    end
}
