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
