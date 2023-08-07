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

            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint(0, true)
                vim.api.nvim_set_hl(0, 'LspInlayHint', { link = 'Comment' })
            end

            -- Don't map 'gc' or 'gb' because they are used by Comment.nvim
            map("n", "gd", function()
                require("telescope.builtin").lsp_definitions()
            end, "Go to definition")

            map("n", "gt", function()
                require("telescope.builtin").lsp_type_definitions()
            end, "Go to type definition")

            map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", "Go to LSP implementations(s)")
            map("n", "gr", "<cmd>Telescope lsp_references<cr>", "Go to LSP reference(s)")

            map('n', '<Leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', 'Show document symbols')
            map('n', '<Leader>fw', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Show workspace symbols')

            map('n', '<Leader>d', '<cmd>Telescope diagnostics bufnr=0<cr>', 'Show buffer diagnostic')
            map('n', '<Leader>w', '<cmd>Telescope diagnostics<cr>', 'Show workspace diagnostic')

            map("n", "<Leader>rn", vim.lsp.buf.rename, "Rename symbol under the cursor")
            map("n", "<Leader>ca", vim.lsp.buf.code_action, "Code actions")

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

                            hint = {
                                enable = true
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


        local namespace = vim.api.nvim_create_namespace("class_conceal")
        local group = vim.api.nvim_create_augroup("class_conceal", { clear = true })

        local conceal_html_class = function(bufnr)
            local language_tree = vim.treesitter.get_parser(bufnr, "html")
            local syntax_tree = language_tree:parse()
            local root = syntax_tree[1]:root()

            local query = vim.treesitter.query.parse(
                "html",
                [[
    ((attribute
        (attribute_name) @att_name (#eq? @att_name "class")
        (quoted_attribute_value (attribute_value) @class_value) (#set! @class_value conceal "…")))
    ]]
            ) -- using single character for conceal thanks to u/Rafat913

            for _, captures, metadata in query:iter_matches(root, bufnr, root:start(), root:end_(), {}) do
                local start_row, start_col, end_row, end_col = captures[2]:range()
                vim.api.nvim_buf_set_extmark(bufnr, namespace, start_row, start_col, {
                    end_line = end_row,
                    end_col = end_col,
                    conceal = metadata[2].conceal,
                })
            end
        end

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
            group = group,
            pattern = "*.html",
            callback = function()
                conceal_html_class(vim.api.nvim_get_current_buf())
            end,
        })
    end,
}
