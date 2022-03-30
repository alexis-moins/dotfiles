require('nvim-treesitter.configs').setup({

    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",

    -- Install languages synchronously
    sync_install = false,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        custom_captures = {
            -- Highlight the @varaible.builtin capture group with the "Constant" highlight group.
            ["variable.builtin"] = "Delimiter",
        },

        -- Use regex on top of treesitter
        additional_vim_regex_highlighting = true,
    },

    indent = {
        -- Indentation based on treesitter for the = operator
        enable = true
    }

})
