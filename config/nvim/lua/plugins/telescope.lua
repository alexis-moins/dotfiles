-- Telescope
local telescope = require('telescope')
local actions = require('telescope.actions')

-- Loading fzf sorter
telescope.load_extension('fzf')

-- Mappings
vim.keymap.set('n', '<leader>ek', '<cmd>Telescope keymaps<CR>')
vim.keymap.set('n', '<leader>e:', '<cmd>Telescope commands<CR>')
vim.keymap.set('n', '<leader>em', '<cmd>Telescope man_pages<CR>')
vim.keymap.set('n', '<leader>eg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>ef', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>eh', '<cmd>Telescope command_history<CR>')
vim.keymap.set('n', '<C-_>', '<cmd>Telescope current_buffer_fuzzy_find<CR>') -- Mapped to C-/

-- Git
vim.keymap.set('n', '<leader>eF', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader>ec', '<cmd>Telescope git_commits<CR>')
vim.keymap.set('n', '<leader>eC', '<cmd>Telescope git_bcommits<CR>')
vim.keymap.set('n', '<leader>eb', '<cmd>Telescope git_branches<CR>')

-- Mappings
telescope.setup({
    defaults = {
        mappings = {

            -- Insert mode mappings
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-u>"] = false
            },

            -- Normal mode mappings
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
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
