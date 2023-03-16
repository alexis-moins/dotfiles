return {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    lazy = true,
    init = function()
        vim.keymap.set("n", "<leader>tt", function()
            require("grapple").toggle()
        end, {
            desc = "Toggle buffer tag",
        })

        vim.keymap.set("n", "<leader>tp", function()
            require("grapple").popup_tags()
        end, {
            desc = "Open tag popup",
        })

        for index, value in ipairs({ "1", "2", "3", "4", "5" }) do
            vim.keymap.set("n", "," .. value, function()
                require("grapple").select({
                    key = index,
                })
            end)
        end
    end,
}
