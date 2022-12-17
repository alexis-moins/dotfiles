local telescope = require('telescope')

local _dropdown = {
    theme = 'dropdown',
    previewer = false,
}

local _ivy = {
    theme = 'ivy',
}

-- Setup
telescope.setup({
    defaults = {
        layout_config = {
            bottom_pane = {
                height = 15,
            },
        },
    },

    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" },
            theme = 'dropdown',
            previewer = false,
        },

        git_files = {
            theme = 'dropdown',
            previewer = false,
        },

        oldfiles = _ivy,
        live_grep = _ivy,
        diagnostics = _ivy,
        lsp_references = _ivy,

        buffers = _dropdown,
        help_tags = _dropdown,
        man_pages = _dropdown,

    },

    extensions = {
        file_browser = {
            theme = "ivy",
            path = "%:p:h",
            quiet = true,

            display_stat = false,
            previewer = false,

            hidden = true,
            hijack_netrw = true,
            respect_gitignore = true,
        },
    }
})

-- Extensions
telescope.load_extension('fzf')

-- Mappings
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fm', require('telescope.builtin').man_pages, { desc = "Find man pages" })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "Grep files" })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = "Find help pages" })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fF', require('telescope.builtin').git_files, { desc = "Find files (git)" })

vim.keymap.set('n', '<leader>fe', require('telescope.builtin').command_history, { desc = "Find commands (history)" })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = "Find recent files" })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = "Find keymaps" })

-- Git
-- Checkout branches
vim.keymap.set('n', '<leader>fB', require('telescope.builtin').git_branches, { desc = "Find git branches" })

-- Commits | Commits from the current branch
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').git_commits, { desc = "Find git commits" })
vim.keymap.set('n', '<leader>fC', require('telescope.builtin').git_bcommits, { desc = "Find current branch's commits" })
