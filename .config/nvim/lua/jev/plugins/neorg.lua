return {
    "nvim-neorg/neorg",
    ft = "norg",
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.keybinds"] = {
                config = {
                    default_keybinds = false
                }
            },

            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        work = "~/notes/work",
                        study = "~/notes/study",
                    },
                },
            },

            ["core.norg.journal"] = {
                config = {
                    workspace = "work",
                },
            },

            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp"
                }
            },

            ["core.norg.concealer"] = {},
        },
    },

    init = function ()
        vim.keymap.set('n', ';jt', ":Neorg journal today<CR>")
    end
}
