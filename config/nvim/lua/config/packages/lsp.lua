-- neovim Language-Server-Protocol
local LSP = require('lspconfig')

-- List of language-servers
local servers = {'pyright'}

-- Default function to run when attaching a client its LSP server
on_attach = function()
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
for i, server in ipairs(servers) do
    LSP[server].setup({
        on_attach = on_attach,
        capabilities = capabilities -- See nvim-cmp
    })
end

