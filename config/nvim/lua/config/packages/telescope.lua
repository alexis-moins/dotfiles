-- Telescope
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_actions = require('telescope.actions')

-- Loading extensions
telescope.load_extension('fzf')

-- Mappings
vim.keymap.set('n', '<leader>ek', telescope_builtin.keymaps)
vim.keymap.set('n', '<leader>e:', telescope_builtin.commands)
vim.keymap.set('n', '<leader>em', telescope_builtin.man_pages)
vim.keymap.set('n', '<leader>eg', telescope_builtin.live_grep)
vim.keymap.set('n', '<leader>eh', telescope_builtin.help_tags)
vim.keymap.set('n', '<leader>ef', telescope_builtin.find_files)
vim.keymap.set('n', '<leader>eH', telescope_builtin.command_history)
vim.keymap.set('n', '<C-_>', telescope_builtin.current_buffer_fuzzy_find) -- Mapped to C-/

-- Git
-- Only search git files
vim.keymap.set('n', '<leader>eF', telescope_builtin.git_files)
-- Checkout branches
vim.keymap.set('n', '<leader>eb', telescope_builtin.git_branches)

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
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
    }
})
