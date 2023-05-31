return {
    "neovim/nvim-lspconfig",
    lazy = false,

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "folke/neodev.nvim",
            config = true,
        },
    },

    keys = {
        { '<leader>lm', ':Mason<cr>',   desc = 'Open Mason',    silent = true },
        { '<leader>li', ':LspInfo<cr>', desc = 'Show Lsp info', silent = true }
    },

    config = function()
        -- Changing mason's UI
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "*",
                    package_pending = "~",
                    package_uninstalled = "-",
                },
                border = "rounded",
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "pyright",
                "emmet_ls",
                "tsserver",
                "lua_ls",
            },
        })

        -- Default function to run when attaching a client its LSP server
        local on_attach = function(_, buffer)
            local utils = require("jev.utils")

            local map = function(mode, keys, action, desc)
                return utils.map(mode, keys, action, desc, { buffer = buffer })
            end

            -- Display information about hovered object
            map("n", "K", vim.lsp.buf.hover, "Show information")

            -- Don't map 'gc' or 'gb' because they are used by Comment.nvim
            -- Goto direct [d]efinitions, t[Y]pe definitions, [i]mplementations
            map("n", "gd", function()
                require("telescope.builtin").lsp_definitions()
            end, "Go to definition")

            map("n", "gt", function()
                require("telescope.builtin").lsp_type_definitions()
            end, "Go to type definition")

            map("n", "gi", function()
            end, "Go to implementations")
                require("telescope.builtin").lsp_implementations()

            -- [g]o to [r]eferences
            map("n", "gr", "<cmd>Telescope lsp_references<CR>", "Go to LSP references")

            -- Navigate between diagnostics
            -- map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
            -- map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")

            -- Formatting and diagnostic list
            map("n", "<leader>fs", function()
                require("telescope.builtin").lsp_document_symbols()
            end, "Buffer symbols")

            map('n', '<leader>fd', '<cmd>Telescope diagnostics bufnr=0<CR>', 'Show buffer diagnostic')
            map('n', '<leader>fw', '<cmd>Telescope diagnostics<CR>', 'Show workspace diagnostic')

            map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol under the cursor")
            map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")

            -- [R]estart neovim LSP client
            map("n", "<leader>lr", ":LspRestart<cr>", "Restart Lsp client")
        end

        -- Capabilities from nvim-cmp
        local client_capabilities = vim.lsp.protocol.make_client_capabilities()
        local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)

        require("mason-lspconfig").setup_handlers({
            -- Default handler called for each server installed with mason
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,
            -- Server-specific config below
            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                })
            end,
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        vim.diagnostic.config({
            float = { border = "rounded" },
            update_in_insert = true,
            virtual_text = false,
        })

        -- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])

        vim.keymap.set("n", "H", function()
            vim.diagnostic.open_float(nil, { focus = false })
        end, {
            desc = "Open diagnostics popup",
        })
    end,
}
