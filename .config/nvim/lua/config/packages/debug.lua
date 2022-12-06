local dap = require('dap')

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    { desc = 'Toggle breakpoint (condition)' })

vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step into' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step over' })

vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Open REPL' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Resume debug session' })

require('dap-python').setup('~/.pyenv/shims/python')

require('dapui').setup()
