local function gh(x) return 'https://github.com/' .. x end

vim.pack.add({
    -- mini
    gh("nvim-mini/mini.hues"),
    gh("nvim-mini/mini.icons"),
    gh("nvim-mini/mini.notify"),
    gh("nvim-mini/mini.extra"),
    gh("nvim-mini/mini.ai"),
    gh("nvim-mini/mini.completion"),
    gh("nvim-mini/mini.diff"),
    gh("nvim-mini/mini.files"),
    gh("nvim-mini/mini.hipatterns"),
    gh("nvim-mini/mini.move"),
    gh("nvim-mini/mini.operators"),
    gh("nvim-mini/mini.pairs"),
    gh("nvim-mini/mini.pick"),
    gh("nvim-mini/mini.surround"),
    gh("nvim-mini/mini.splitjoin"),
    gh("nvim-mini/mini.cmdline"),
    gh("nvim-mini/mini.input"),

    -- lsp
    gh("neovim/nvim-lspconfig"),
    gh("mason-org/mason.nvim"),

    -- formatting
    gh("stevearc/conform.nvim"),

    -- treesitter
    {
        src = gh("nvim-treesitter/nvim-treesitter"),
        version = "main",
    },
    {
        src = gh("nvim-treesitter/nvim-treesitter-textobjects"),
        version = "main",
    },

    -- colorscheme
    {
        src = gh('rose-pine/neovim'),
        name = 'rose-pine'
    }
})
