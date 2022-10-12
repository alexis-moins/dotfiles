-- {{{ mason.nvim
local mason = require('mason')
-- local mason_lsp = require('mason-lspconfig').setup()
local mason_installer = require('mason-tool-installer')

local servers = {
    -- LSP
    'pyright',
    'emmet_ls',
    'tsserver',
    'sumneko_lua',
    'phpactor',
    'intelephense',
    'jdtls',
    'gopls',
    'svelte',

    -- volar is setup at the bottom
}

local packages = {
    -- LSP
    'pyright',
    'emmet-ls',
    'typescript-language-server',
    'lua-language-server',
    'vue-language-server',
    'intelephense',
    'phpactor',
    'jdtls',
    'gopls',
    'svelte-language-server',

    -- Formatters
    'autopep8',
    'prettier',
    -- 'php-cs-fixer',
}

-- Changing mason's UI
mason.setup {
    ui = {
        icons = {
            package_installed = "*",
            package_pending = "~",
            package_uninstalled = "-"
        }
    }
}

mason_installer.setup {
    -- Automatically install the following tools
    ensure_installed = packages
}
-- }}}

-- {{{ null-ls.nvim
local null_ls = require("null-ls")

-- Sources to register
local sources = {
    null_ls.builtins.formatting.autopep8,

    null_ls.builtins.formatting.prettier.with {
        extra_args = { "--no-config", "--tab-width", "4" }
    },
}

null_ls.setup { sources = sources }
-- }}}

-- {{{ nvim-lspconfig

local lsp = require('lspconfig')
local telescope_builtin = require('telescope.builtin')

-- Default function to run when attaching a client its LSP server
local on_attach = function(_, bufnr)
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

    -- Goto [r]eferences, [s]ymbols in the buffer, [S]ymbols in the workspace
    vim.keymap.set("n", "gr", telescope_builtin.lsp_references, get_opts_with_desc("Show references"))
    vim.keymap.set("n", "gs", telescope_builtin.lsp_document_symbols, get_opts_with_desc("Show symbols"))
    vim.keymap.set("n", "gS", telescope_builtin.lsp_workspace_symbols, get_opts_with_desc("Show workspace symbols"))

    -- Rename symbol and Code actions
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, get_opts_with_desc("Rename"))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, get_opts_with_desc("Code actions"))

    -- Navigate between diagnostics
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, get_opts_with_desc("Next diagnostic"))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, get_opts_with_desc("Previous diagnostic"))

    -- Formatting and diagnostic list
    vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, get_opts_with_desc("Format file"))
    vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics, get_opts_with_desc("Open diagnostics"))

    -- [re]start neovim LSP client
    vim.keymap.set("n", '<leader>lr', '<cmd>LspRestart<cr>', get_opts_with_desc("Restart LSP server"))
end

-- Capabilities from nvim-cmp
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(client_capabilities)

-- Configuring all servers
for _, server in ipairs(servers) do
    lsp[server].setup({
        -- Execute this when attaching a LSP server to the current buffer
        on_attach = on_attach,

        -- Inform servers about the capabilities. See nvim-cmp
        capabilities = capabilities,

        settings = {
            -- Settings only applied to lua filetype
            Lua = {
                -- Inject `vim` as a global for diagnostics
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    })
end

lsp['volar'].setup({
    on_attach = on_attach,

    capabilities = capabilities,

    init_options = {
        typescript = {
            serverPath = '/usr/local/lib/node_modules/typescript/lib/tsserverlibrary.js'
        }
    }
})

-- }}}
