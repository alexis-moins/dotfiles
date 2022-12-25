return {
    -- Language servers
    'neovim/nvim-lspconfig',
    event = 'BufWinEnter',

    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        'j-hui/fidget.nvim'
    },

    init = function()
        local mapping = require 'utils'.mapping
        mapping('n', '<leader>lm', vim.cmd.Mason, 'Open Mason popup')
        mapping('n', '<leader>li', vim.cmd.LspInfo, 'Show LSP client information')
    end,

    config = function()
        -- Changing mason's UI
        require('mason').setup {
            ui = {
                icons = {
                    package_installed = '*',
                    package_pending = '~',
                    package_uninstalled = '-'
                },

                border = 'rounded'
            }
        }

        require('mason-lspconfig').setup {
            ensure_installed = {
                'pyright',
                'emmet_ls',
                'tsserver',
                'sumneko_lua',
            }
        }

        require('mason-nvim-dap').setup({
            ensure_installed = {
                'python'
            },

            automatic_setup = true,
        })

        -- Default function to run when attaching a client its LSP server
        local on_attach = function(_, buffer)
            -- Default options
            local opts = function(description)
                return { silent = true, buffer = buffer, desc = description }
            end

            -- Display information about hovered object
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('Show information'))

            -- Don't map 'gc' or 'gb' because they are used by Comment.nvim
            -- Goto direct [d]efinitions, t[Y]pe definitions, [i]mplementations
            vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end,
                opts('Go to definition'))

            vim.keymap.set('n', 'gy', function() require('telescope.builtin').lsp_type_definitions() end,
                opts('Go to type definition'))

            vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end,
                opts('Go to implementations'))

            -- Goto [r]eferences
            vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end,
                opts('Show references'))

            -- Navigate between diagnostics
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts('Next diagnostic'))
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts('Previous diagnostic'))

            -- Formatting and diagnostic list
            vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts('Format file'))
            vim.keymap.set('n', '<leader>fs', function() require('telescope.builtin').lsp_document_symbols() end,
                opts('Buffer symbols'))

            -- Diagnostics
            -- vim.keymap.set('n', '<leader>ld', ':Telescope diagnostics bufnr=0<CR>', opts('Show diagnostics (buffer)'))

            -- [r]ename symbol and code [a]ctions
            vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts('Rename symbol under the cursor'))
            vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts('Code actions'))

            -- [R]estart neovim LSP client
            vim.keymap.set('n', '<leader>lR', '<cmd>LspRestart<cr>', opts('Restart LSP server'))
        end

        -- Capabilities from nvim-cmp
        local client_capabilities = vim.lsp.protocol.make_client_capabilities()
        local capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)

        require('mason-lspconfig').setup_handlers {

            -- Default handler called for each server installed with mason
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
            end,

            -- Server-specific config below
            ['sumneko_lua'] = function()
                require('lspconfig').sumneko_lua.setup {
                    capabilities = capabilities,
                    on_attach = on_attach,

                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' }
                            }
                        }
                    }
                }
            end
        }

        require('fidget').setup({
            window = {
                blend = 0
            },

            align = {
                bottom = false
            }
        })

        vim.cmd([[hi! link FidgetTask Comment]])

        local null_ls = require('null-ls')

        require('null-ls').setup {
            sources = {
                null_ls.builtins.formatting.autopep8,

                null_ls.builtins.formatting.prettier.with {
                    extra_args = { '--no-config', '--tab-width', '4' }
                },
            }
        }

    end
}
