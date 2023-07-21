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
        { '<Leader>lm', ':Mason<cr>',   desc = 'Open Mason',    silent = true },
        { '<Leader>li', ':LspInfo<cr>', desc = 'Show Lsp info', silent = true }
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

        require("mason-lspconfig").setup()

        -- Default function to run when attaching a client its LSP server
        local on_attach = function(client, buffer)
            local utils = require("jev.utils")

            local map = function(mode, keys, action, desc)
                return utils.map(mode, keys, action, desc, { buffer = buffer })
            end

            if client.server_capabilities.inlayHintProvider then vim.lsp.buf.inlay_hint(buffer, true) end

            -- Don't map 'gc' or 'gb' because they are used by Comment.nvim
            -- Goto direct [d]efinitions, t[Y]pe definitions, [i]mplementations
            map("n", "gd", function()
                require("telescope.builtin").lsp_definitions()
            end, "Go to definition")

            map("n", "gt", function()
                require("telescope.builtin").lsp_type_definitions()
            end, "Go to type definition")

            -- [g]o to [i]mplementations
            map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", "Go to LSP implementations(s)")

            -- [g]o to [r]eferences
            map("n", "gr", "<cmd>Telescope lsp_references<cr>", "Go to LSP reference(s)")

            -- Navigate between diagnostics
            -- map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
            -- map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")

            map('n', '<Leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', 'Show LSP symbols')

            map('n', '<Leader>fd', '<cmd>Telescope diagnostics bufnr=0<cr>', 'Show buffer diagnostic')
            map('n', '<Leader>fw', '<cmd>Telescope diagnostics<cr>', 'Show workspace diagnostic')

            map("n", "<Leader>rn", vim.lsp.buf.rename, "Rename symbol under the cursor")
            map("n", "<Leader>ca", vim.lsp.buf.code_action, "Code actions")

            -- [R]estart neovim LSP client
            map("n", "<Leader>lr", "<cmd>LspRestart<cr>", "Restart Lsp client")
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
