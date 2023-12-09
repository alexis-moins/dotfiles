return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = {
			input = {
				win_options = {
					winblend = 0,
				},
			},
		},
	},

	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {},

		keys = {
			{ "<Leader>gf", "<cmd>Neogen func<cr>", silent = true },
		},
	},

	{
		"tpope/vim-projectionist",
		event = "VeryLazy",
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git" },
		keys = {
			{ "<Leader>gs", "<cmd>Git<cr>", silent = true },
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },

				typescript = { { "prettierd", "prettier" } },
			},
		},

		keys = {
			{
				"=",
				function()
					require("conform").format({ async = true })
				end,
				silent = true,
				desc = "Format file",
			},
			{
				"<Leader>fi",
				"<cmd>ConformInfo<cr>",
				silent = true,
				desc = "Open formatters info",
			},
		},
	},

	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
	},

	{
		"folke/twilight.nvim",
		opts = {},
	},
}
