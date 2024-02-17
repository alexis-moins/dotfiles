local map = JevKeys.map
local add = MiniDeps.add

-- Git integration
add("tpope/vim-fugitive")
map("n", "<Leader>gs", "<cmd>Git<cr>", "Open [g]it [s]tatus")

--
-- Load the rest of the plugins
--
require("jev.plugins.mini")
require("jev.plugins.treesitter")

require("jev.plugins.gitsigns")
require("jev.plugins.lsp")

-- return {
-- 	{
-- 		"nvim-lua/plenary.nvim",
-- 		lazy = true,
-- 	},
--
-- 	-- {
-- 	-- 	"stevearc/dressing.nvim",
-- 	-- 	event = "VeryLazy",
-- 	-- 	config = {
-- 	-- 		input = {
-- 	-- 			win_options = {
-- 	-- 				winblend = 0,
-- 	-- 			},
-- 	-- 		},
-- 	-- 	},
-- 	-- },
--
-- 	{
-- 		"danymat/neogen",
-- 		dependencies = "nvim-treesitter/nvim-treesitter",
-- 		opts = {},
--
-- 		keys = {
-- 			{ "<Leader>gf", "<cmd>Neogen func<cr>", silent = true },
-- 		},
-- 	},
--
-- 	{
-- 		"tpope/vim-projectionist",
-- 		event = "VeryLazy",
-- 	},
--
-- 	{
-- 		"tpope/vim-fugitive",
-- 		cmd = { "Git" },
-- 		keys = {
-- 			{ "<Leader>gs", "<cmd>Git<cr>", silent = true },
-- 		},
-- 	},
--
-- 	{
-- 		"stevearc/conform.nvim",
-- 		opts = {
-- 			formatters_by_ft = {
-- 				lua = { "stylua" },
-- 				-- Conform will run multiple formatters sequentially
-- 				python = { "isort", "black" },
-- 				-- Use a sub-list to run only the first available formatter
-- 				javascript = { { "prettierd", "prettier" } },
-- 				json = { { "prettierd", "prettier" } },
--
-- 				typescript = { { "prettierd", "prettier" } },
-- 			},
-- 		},
--
-- 		keys = {
-- 			{
-- 				"=",
-- 				function()
-- 					require("conform").format({ async = true, lsp_fallback = true })
-- 				end,
-- 				silent = true,
-- 				desc = "Format file",
-- 			},
-- 			{
-- 				"<Leader>fi",
-- 				"<cmd>ConformInfo<cr>",
-- 				silent = true,
-- 				desc = "Open formatters info",
-- 			},
-- 		},
-- 	},
--
-- 	{
-- 		"folke/twilight.nvim",
-- 		opts = {},
-- 	},
-- }
