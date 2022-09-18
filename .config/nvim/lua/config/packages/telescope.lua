-- Telescope
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_actions = require('telescope.actions')

-- Extensions
telescope.load_extension('fzf')

-- Mappings
vim.keymap.set('n', '<leader>eb', telescope_builtin.buffers)
vim.keymap.set('n', '<leader>em', telescope_builtin.man_pages)
vim.keymap.set('n', '<leader>eg', telescope_builtin.live_grep)
vim.keymap.set('n', '<leader>eh', telescope_builtin.help_tags)
vim.keymap.set('n', '<leader>ef', telescope_builtin.find_files)
vim.keymap.set('n', '<leader>ee', telescope_builtin.command_history)

-- Git
-- Checkout branches
vim.keymap.set('n', '<leader>eB', telescope_builtin.git_branches)
-- Commits | Commits from the current branch
vim.keymap.set('n', '<leader>ec', telescope_builtin.git_commits)
vim.keymap.set('n', '<leader>eC', telescope_builtin.git_bcommits)

-- Mappings
telescope.setup({
    defaults = {
        mappings = {

            -- Insert mode mappings
            i = {
                ["<C-j>"] = telescope_actions.move_selection_next,
                ["<C-k>"] = telescope_actions.move_selection_previous,
                ["<C-u>"] = false
            },

            -- Normal mode mappings
            n = {
                ["<C-j>"] = telescope_actions.move_selection_next,
                ["<C-k>"] = telescope_actions.move_selection_previous,
                ["<C-u>"] = false
            }
        }
    },

    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" }
        },
    }
})
