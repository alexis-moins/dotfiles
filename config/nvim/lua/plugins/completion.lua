
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {

    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    },

    formatting = {
        format = lspkind.cmp_format {
            mode = 'text',
            with_text = true,
            menu = {
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                path = "[path]",
                buffer = "[buf]",
            }
        }
    }

}
