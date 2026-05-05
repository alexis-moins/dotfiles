vim.pack.add({
    gh("neovim/nvim-lspconfig"),
    gh("mason-org/mason.nvim"),
    gh("stevearc/conform.nvim"),
})

-- LSP ========================================================================

vim.lsp.enable({
    "lua_ls",
    "pyright",
    "ts_ls",

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
