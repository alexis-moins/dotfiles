-- Language-Server-Protocol
local lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

-- List of language-servers
local servers = { 'pyright', 'sumneko_lua' }

-- Ensure the servers above are installed
lsp_installer.setup({
    -- Automatically install the servers mentioned below
    ensure_installed = servers,

    ui = {
        -- Redefine server icons
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Default function to run when attaching a client its LSP server
local on_attach = function()
    -- Display information about hovered object
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})

    -- Don't map 'gc' or 'gb' because they are used by Comment.nvim
    -- Goto direct [d]efinition, t[Y]pe definition, [i]mplementation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})

    -- Rename symbol
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})

    -- Navigate between diagnostics
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {buffer=0})

    -- Telescope
    vim.keymap.set("n", "<leader>ed", "<cmd>Telescope diagnostics<CR>", {buffer=0})
    vim.keymap.set("n", "<leader>es", "<cmd>Telescope lsp_document_symbols<CR>", {buffer=0})
    vim.keymap.set("n", "<leader>er", "<cmd>Telescope lsp_references<CR>", {buffer=0})
end

-- Capabilities from nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

-- Configuring all servers
for _, server in ipairs(servers) do
    lsp[server].setup({
        -- Execute this when attaching a LSP server to the current buffer
        on_attach = on_attach,

        -- Inform servers about the capabilities. See nvim-cmp
        capabilities = capabilities,

        settings = {
            -- Settings only applied to [lua] filetype
            Lua = {
                -- Inject `vim` as a global for diagnostics
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    })
end

