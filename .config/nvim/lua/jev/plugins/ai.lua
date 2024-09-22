local add = MiniDeps.add

--
-- CodeCompanion
--
add({
	source = "olimorris/codecompanion.nvim",
	depends = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",

		"github/copilot.vim",
	},
})

require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
		agent = {
			adapter = "copilot",
		},
	},
})

keys.map({ "n", "v" }, "<Leader>cc", "<cmd>CodeCompanionActions<cr>", "Open CodeCompanion menu")
keys.map({ "n", "v" }, "|a", "<cmd>CodeCompanionToggle<cr>", "Toggle CodeCompanion")

keys.map("v", "ga", "<cmd>CodeCompanionAdd<cr>", "Add selection to CodeCompanion")

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd.cabbrev([[cc CodeCompanion]])

-- Map <C-J> to accept the completion in insert mode
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.g.copilot_no_tab_map = true
