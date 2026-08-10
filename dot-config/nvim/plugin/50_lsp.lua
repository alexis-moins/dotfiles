local map, maplocal = Config.map, Config.maplocal

-- LSP ========================================================================

vim.lsp.enable({
    "lua_ls",
    "pyright",
    "ts_ls",
    "ruff",

    -- Since v3.0.0, the Vue language server requires vtsls to support typescript
    "vtsls",
    "vue_ls",
})

-- Mason ======================================================================

require("mason").setup()

-- Conform ====================================================================

local prettiers = {
    "prettierd",
    "prettier",
    stop_at_first = true,
}

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = prettiers,
        json = prettiers,
        typescript = prettiers,
        php = { "pint" },
        ocaml = { "ocamlformat" },
    },

    -- Default format options
    default_format_opts = {
        async = true,
        lsp_format = "fallback",
    },
})

-- Tree-sitter ================================================================

-- Auto-install these language parsers
require("nvim-treesitter").install({
    "html",
    "css",
    "scss",

    "vue",
    "javascript",
    "typescript",
})

Config.new_autocmd("PackChanged", nil, function(event)
    if (event.data.kind == "install" or event.data.kind == "update") and event.data.spec.name == "nvim-treesitter" then
        local ok = pcall(vim.cmd.TSUpdate)

        if not ok then
            vim.notify("TSUpdate failed!", vim.log.levels.WARN)
        end
    end
end)

-- Override default nvim lsp mapping with mini.pick
Config.new_autocmd("LspAttach", nil, function(args)
    map("n", "gri", "<Cmd>Pick lsp scope='implementation'<CR>", "Find implementations")
    map("n", "grr", "<Cmd>Pick lsp scope='references'<CR>", "Find references")

    map("n", "grt", "<Cmd>Pick lsp scope='type_definition'<CR>", "Find type definitions")
    map("n", "grd", "<Cmd>Pick lsp scope='definition'<CR>", "Find definitions")

    map("n", "gO", "<Cmd>Pick lsp scope='document_symbol'<CR>", "Find document symbols")

    map("n", "gR", "<Cmd>lsp restart<CR>", "Restart all clients attached to the current buffer")
    map("n", "gI", "<Cmd>checkhealth vim.lsp<CR>", "Shows the statsu of active LSP clients and servers")

    map("n", "gw", "<Cmd>Pick lsp scope='workspace_symbol_live'<CR>", "")

    -- maplocal("n", "<Leader>ld", "<Cmd>Pick lsp scope='definition'<CR>", "Go to definition")
    -- maplocal("n", "<Leader>lr", "<Cmd>Pick lsp scope='references'<CR>", "Go to references")

    -- maplocal("n", "<Leader>lt", "<Cmd>Pick lsp scope='type_definition'<CR>", "Go to type definitions")

    -- maplocal("n", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Execute code action")
    -- maplocal("n", "<Leader>ln", "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol under cursor")

    -- maplocal("n", "<Leader>lO", "<Cmd>Pick lsp scope='document_symbol'<CR>", "Find document symbol")

    maplocal("n", "<Leader>lw", '<Cmd>Pick diagnostic scope="all"<CR>', "Find workspace diagnostic")

    maplocal("n", "<Leader>lD", '<Cmd>Pick diagnostic scope="current"<CR>', "Find buffer diagnostic")

    -- maplocal("n", "<Leader>lw", "<Cmd>Pick lsp scope='workspace_symbol'<CR>", "Find workspace symbol")

    maplocal("n", "<Leader>lR", "<Cmd>LspRestart<CR>", "Restart LSP")
    maplocal("n", "<Leader>li", "<Cmd>LspInfo<CR>", "Show LSP info")
end)
