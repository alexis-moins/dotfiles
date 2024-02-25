local add = MiniDeps.add

--
-- nvim-treesitter
--
add({
	source = "nvim-treesitter/nvim-treesitter",
	hooks = { post_checkout = vim.cmd.TSUpdate },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
})

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
		select = {
			enable = true,
			lookahead = true,

			keymaps = {
				["af"] = { query = "@function.outer", desc = "a function" },
				["if"] = { query = "@function.inner", desc = "inner function" },

				["aP"] = { query = "@parameter.outer", desc = "a parameter" },
				["iP"] = { query = "@parameter.inner", desc = "inner parameter" },

				["ac"] = { query = "@comment.outer", desc = "a comment" },
				["ic"] = { query = "@comment.inner", desc = "inner comment" },

				["as"] = { query = "@class.outer", desc = "a class" },
				["is"] = { query = "@class.inner", desc = "inner class" },

				["aa"] = { query = "@attribute.outer", desc = "an attribute" },
				["ia"] = { query = "@attribute.inner", desc = "inner attribute" },
			},
		},

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
				["]f"] = "@function.outer",
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
