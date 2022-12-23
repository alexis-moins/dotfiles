local options = {
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
            quiet = true,

            display_stat = false,
            previewer = false,

            hidden = true,
            hijack_netrw = true,
            respect_gitignore = true,
        },

        undo = {
            theme = 'ivy'
        }
    }
}

local dropdown_pickers = {
    'buffers',
    'help_tags',
    'man_pages',
    'git_files'
}

for _, picker in ipairs(dropdown_pickers) do
    options.pickers[picker] = {
        theme = 'dropdown',
        previewer = false,
    }
end

local ivy_pickers = {
    'oldfiles',
    'live_grep',
    'diagnostics',
    'lsp_references',
}

for _, picker in ipairs(ivy_pickers) do
    options.pickers[picker] = { theme = 'ivy' }
end

local telescope = require('telescope')
telescope.setup(options)

-- Extensions
telescope.load_extension('fzf')
telescope.load_extension('undo')
telescope.load_extension('file_browser')

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

vim.keymap.set('n', '<leader>fB', require('telescope.builtin').git_branches, { desc = "Find git branches" })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').git_commits, { desc = "Find git commits" })
vim.keymap.set('n', '<leader>fC', require('telescope.builtin').git_bcommits, { desc = "Find current branch's commits" })

-- Extensions
vim.keymap.set('n', '-', require('telescope').extensions.file_browser.file_browser, { desc = "Browse files" })
vim.keymap.set('n', '<leader>fu', require('telescope').extensions.undo.undo, { desc = "Browse undo tree" })
