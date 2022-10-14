-- Telescope
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

-- Extensions endpoint
local extensions = telescope.extensions

-- Setup
telescope.setup({
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" },
            theme = 'dropdown',
            previewer = false,
        },

    },

    extensions = {
        file_browser = {
            theme = "ivy",
            path = "%:p:h",

            hidden = true,
            hijack_netrw = true,
            respect_gitignore = true,

        },
    }
})

-- Extensions
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

-- Mappings
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fm', telescope_builtin.man_pages, { desc = "Find man pages" })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = "Grep files" })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = "Find help pages" })
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fe', telescope_builtin.command_history, { desc = "Find commands (history)" })
vim.keymap.set('n', '<leader>fr', telescope_builtin.oldfiles, { desc = "Find recent files" })

-- Git
-- Checkout branches
vim.keymap.set('n', '<leader>fB', telescope_builtin.git_branches, { desc = "Find git branches" })
-- Commits | Commits from the current branch
vim.keymap.set('n', '<leader>fc', telescope_builtin.git_commits, { desc = "Find git commits" })
vim.keymap.set('n', '<leader>fC', telescope_builtin.git_bcommits, { desc = "Find current branch's commits" })

-- File browser extension
vim.keymap.set('n', '<leader>f.', extensions.file_browser.file_browser, { desc = "Browse files" })
