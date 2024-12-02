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
keys.map({ "n", "v" }, "|a", "<cmd>CodeCompanionChat toggle<cr>", "Toggle CodeCompanion")

keys.map("v", "ga", "<cmd>CodeCompanionAdd<cr>", "Add selection to CodeCompanion")

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd.cabbrev([[cc CodeCompanion]])
