-- Telescope
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

-- Extensions endpoint
local extensions = telescope.extensions

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
telescope.load_extension('file_browser')

-- Mappings
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fm', telescope_builtin.man_pages, { desc = "Find man pages" })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = "Grep files" })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = "Find help pages" })

vim.keymap.set('n', '<leader>ff', telescope_builtin.git_files, { desc = "Find files (git)" })
vim.keymap.set('n', '<leader>fF', telescope_builtin.find_files, { desc = "Find files" })

vim.keymap.set('n', '<leader>fe', telescope_builtin.command_history, { desc = "Find commands (history)" })
vim.keymap.set('n', '<leader>fr', telescope_builtin.oldfiles, { desc = "Find recent files" })
vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = "Find keymaps" })

-- Git
-- Checkout branches
vim.keymap.set('n', '<leader>fB', telescope_builtin.git_branches, { desc = "Find git branches" })

-- Commits | Commits from the current branch
vim.keymap.set('n', '<leader>fc', telescope_builtin.git_commits, { desc = "Find git commits" })
vim.keymap.set('n', '<leader>fC', telescope_builtin.git_bcommits, { desc = "Find current branch's commits" })

-- File browser extension
vim.keymap.set('n', '<leader>f.', extensions.file_browser.file_browser, { desc = "Browse files" })
