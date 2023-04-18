return {
    -- Language servers
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        "jose-elias-alvarez/null-ls.nvim",
        "jay-babu/mason-null-ls.nvim",

        {
            "folke/neodev.nvim",
            config = true,
        },
    },
    init = function()
        local mapping = require("utils").map

        mapping("n", "<leader>lm", vim.cmd.Mason, "Open Mason popup")
        mapping("n", "<leader>li", vim.cmd.LspInfo, "Show LSP client information")
    end,
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

        require("mason-null-ls").setup({
            ensure_installed = {
                "autopep8",
                "prettier",
            },
            automatic_installation = false,
            automatic_setup = true, -- Recommended, but optional
        })

        require("null-ls").setup({
            update_in_insert = true,
        })

        require("mason-nvim-dap").setup({
            ensure_installed = {
                "python",
            },
            automatic_setup = true,
        })

        -- Default function to run when attaching a client its LSP server
        local on_attach = function(_, buffer)
            -- Default options
            local mapping = require("utils").map
            local map = function(mode, keys, action, desc)
                return mapping(mode, keys, action, desc, buffer)
            end

            -- Display information about hovered object
            map("n", "K", vim.lsp.buf.hover, "Show information")

            -- Don't map 'gc' or 'gb' because they are used by Comment.nvim
            -- Goto direct [d]efinitions, t[Y]pe definitions, [i]mplementations
            map("n", "gd", function()
                require("telescope.builtin").lsp_definitions()
            end, "Go to definition")
            map("n", "gy", function()
                require("telescope.builtin").lsp_type_definitions()
            end, "Go to type definition")
            map("n", "gi", function()
                require("telescope.builtin").lsp_implementations()
            end, "Go to implementations")

            -- Goto [r]eferences
            map("n", "gr", function()
                require("telescope.builtin").lsp_references()
            end, "Show references")

            -- Navigate between diagnostics
            map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
            map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")

            -- Formatting and diagnostic list
            map("n", "<leader>fs", function()
                require("telescope.builtin").lsp_document_symbols()
            end, "Buffer symbols")

            -- Diagnostics
            mapping("n", "<leader>fd", function()
                require("telescope.builtin").diagnostics({ bufnr = 0 })
            end, "Show diagnostics (buffer)")

            -- [r]ename symbol and code [a]ctions
            map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol under the cursor")
            map("n", "<leader>la", vim.lsp.buf.code_action, "Code actions")

            -- [R]estart neovim LSP client
            map("n", "<leader>lR", "<cmd>LspRestart<cr>", "Restart LSP server")
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
