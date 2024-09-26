local add = MiniDeps.add

--
-- NOTE: To register new textobjects, take a look at textobjects.lua
--

--
-- nvim-treesitter
--
add({
	source = "nvim-treesitter/nvim-treesitter",
	checkout = "master", monitor = "main",
	hooks = { post_checkout = vim.cmd.TSUpdate },
})

add("nvim-treesitter/nvim-treesitter-textobjects")

require("nvim-treesitter.configs").setup({
	auto_install = true,
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
		disable = { "python", "ts" },
	},

	textobjects = {
		swap = {
			enable = true,

			swap_next = {
				["<Leader>a"] = { query = "@parameter.inner", desc = "Swap next parameter" },
			},
			swap_previous = {
				["<Leader>A"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
			},
		},

		move = {
			enable = true,
			set_jumps = true,

			goto_next_start = {
				["]f"] = { query = "@function.outer", desc = "Next function start" },
				["]p"] = { query = "@parameter.inner", desc = "Next parameter start" },
				["]c"] = { query = "@comment.inner", desc = "Next comment start" },
				["]s"] = { query = "@class.inner", desc = "Next class start" },
			},

			goto_previous_start = {
				["[f"] = { query = "@function.inner", desc = "Previous function start" },
				["[p"] = { query = "@parameter.inner", desc = "Previous parameter start" },
				["[c"] = { query = "@comment.inner", desc = "Previous comment start" },
				["[s"] = { query = "@class.inner", desc = "Previous class start" },
			},

			goto_next_end = {
				["]F"] = { query = "@function.outer", desc = "Previous function end" },
				["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
				["]C"] = { query = "@comment.outer", desc = "Next comment end" },
				["]S"] = { query = "@class.outer", desc = "Next class end" },
			},

			goto_previous_end = {
				["[F"] = { query = "@function.outer", desc = "Previous function end" },
				["[P"] = { query = "@parameter.outer", desc = "Previous parameter end" },
				["[C"] = { query = "@comment.outer", desc = "Previous comment end" },
				["[S"] = { query = "@lass.outer", desc = "Previous class end" },
			},
		},
	},
})

--
-- Treesitter context
--
add("nvim-treesitter/nvim-treesitter-context")

require("treesitter-context").setup({
    separator = '─',
    multiline_threshold = 1,
    max_lines = 5
})

-- add("OXY2DEV/helpview.nvim")
