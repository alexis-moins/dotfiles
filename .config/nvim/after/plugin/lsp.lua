-- Changing mason's UI
require('mason').setup {
    ui = {
        icons = {
            package_installed = "*",
            package_pending = "~",
            package_uninstalled = "-"
        }
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

-- Default function to run when attaching a client its LSP server
local on_attach = function(_, bufnr)
    local telescope_builtin = require('telescope.builtin')

    -- Default options
    local get_opts_with_desc = function(description)
        return { noremap = true, silent = true, buffer = bufnr, desc = description }
    end

    -- Display information about hovered object
    vim.keymap.set("n", "K", vim.lsp.buf.hover, get_opts_with_desc("Show information"))

    -- Don't map 'gc' or 'gb' because they are used by Comment.nvim
    -- Goto direct [d]efinitions, t[Y]pe definitions, [i]mplementations
    vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, get_opts_with_desc("Go to definition"))
    vim.keymap.set("n", "gy", telescope_builtin.lsp_type_definitions, get_opts_with_desc("Go to type definition"))
    vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, get_opts_with_desc("Go to implementations"))

    -- Goto [r]eferences
    vim.keymap.set("n", "gr", telescope_builtin.lsp_references, get_opts_with_desc("Show references"))

    -- Navigate between diagnostics
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, get_opts_with_desc("Next diagnostic"))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, get_opts_with_desc("Previous diagnostic"))

    -- Formatting and diagnostic list
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, get_opts_with_desc("Format file"))

    -- Diagnostics
    vim.keymap.set("n", "<leader>ld", ':Telescope diagnostics bufnr=0<CR>',
        get_opts_with_desc("Show diagnostics (buffer)"))

    -- [r]ename symbol and code [a]ctions
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, get_opts_with_desc("Rename symbol under the cursor"))
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, get_opts_with_desc("Code actions"))

    -- [R]estart neovim LSP client
    vim.keymap.set("n", '<leader>lR', '<cmd>LspRestart<cr>', get_opts_with_desc("Restart LSP server"))
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

local null_ls = require("null-ls")

require("null-ls").setup {
    sources = {
        null_ls.builtins.formatting.autopep8,

        null_ls.builtins.formatting.prettier.with {
            extra_args = { "--no-config", "--tab-width", "4" }
        },
    }
}
