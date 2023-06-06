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
                    default_keybinds = false,
                    hook = function(keybinds)
                        keybinds.map("norg", "n", "<Leader>ng",
                            "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>")
                    end
                }
            },

            ["core.dirman"] = {
                config = {
                    workspaces = {
                        work = "~/notes/work",
                        study = "~/notes/study",
                    },
                },
            },

            ["core.ui.calendar"] = {},

            ["core.journal"] = {
                config = {
                    workspace = "work",
                },
            },

            ["core.export"] = {},

            ["core.completion"] = {
                config = {
                    engine = "nvim-cmp"
                }
            },

            ["core.concealer"] = {
                config = {
                    dim_code_blocks = {
                        adaptative = false,
                        conceal = true
                    }
                }
            },
        },
    },

    init = function()
        vim.keymap.set('n', ',jt', "<cmd>Neorg journal today<CR>")
        vim.keymap.set('n', ',jy', "<cmd>Neorg journal yesterday<CR>")
    end
}
