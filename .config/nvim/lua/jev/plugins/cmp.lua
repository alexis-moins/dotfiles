return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",

        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-cmdline",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        {
            "zbirenbaum/copilot-cmp",
            config = function()
                require("copilot_cmp").setup({})
            end,
            dependencies = {
                {
                    "zbirenbaum/copilot.lua",
                    opts = {
                        suggestion = { enabled = false },
                        panel = { enabled = false },
                    },
                },
            },
        },
    },

    lazy = true,
    config = function()
        local cmp = require("cmp")

        vim.opt.completeopt = { "menuone", "noselect" }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            experimental = {
                ghost_text = true,
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:Normal,FloatBorder:CmpBorder,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = "Normal:Normal,FloatBorder:CmpBorder",
                }),
            },
            mapping = {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-n>"] = function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end,
                    ["<C-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
            },
            sources = cmp.config.sources({
                { name = "copilot" },
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "neorg" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "path" },
                { name = "calc" },
                { name = "buffer", keyword_length = 2 },
            }),
            formatting = {
                format = function(entry, vim_item)
                    local menu = {
                        copilot = "Copilot",
                        nvim_lua = "API",
                        nvim_lsp = "LSP",
                        luasnip = "Snippet",
                        buffer = "Buffer",
                        path = "Path",
                        calc = "Math",
                    }

                    vim_item.menu = menu[entry.source.name]
                    return vim_item
                end,
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
