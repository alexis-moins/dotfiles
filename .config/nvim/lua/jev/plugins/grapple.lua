return {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = 'Grapple',
    opts = {},

    keys = {
        { '<leader>gg', ':GrappleToggle<cr>',         desc = 'Toggle tag for buffer',      silent = true },
        { '<leader>gp', ':GrapplePopup tags<cr>',     desc = 'Open Grapple tag popup',     silent = true },

        { '[g',         ':GrappleCycle backward<cr>', desc = 'Go to previous Grapple tag', silent = true },
        { ']g',         ':GrappleCycle forward<cr>',  desc = 'Go to next Grapple tag',     silent = true },

        { '<C-X>', ':GrappleSelect key=1<cr>',   desc = 'Go to Grapple tag #1',       silent = true },
        { '<C-C>', ':GrappleSelect key=2<cr>',   desc = 'Go to Grapple tag #2',       silent = true },
        { '<C-N>', ':GrappleSelect key=3<cr>',   desc = 'Go to Grapple tag #3',       silent = true },
        { '<C-M>', ':GrappleSelect key=4<cr>',   desc = 'Go to Grapple tag #4',       silent = true },
    },
}
