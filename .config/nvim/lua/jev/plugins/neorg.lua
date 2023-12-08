return {
	"nvim-neorg/neorg",
	ft = "norg",
	cmd = "Neorg",
	build = ":Neorg sync-parsers",

	keys = {
		{ "<Leader>j.", "<cmd>Neorg journal today<CR>", desc = "Open journal for today" },
		{ "<Leader>j[", "<cmd>Neorg journal yesterday<CR>", desc = "Open journal from yesterday " },
		{ "<Leader>j]", "<cmd>Neorg journal tomorrow<CR>", desc = "Open journal for tomorrow" },
		{ "<Leader>jj", "<cmd>Neorg journal custom<CR>", desc = "Select journal to open" },
	},

	opts = {
		load = {
			["core.defaults"] = {},
			["core.keybinds"] = {
				config = {
					default_keybinds = true,
					hook = function(keybinds)
						keybinds.map(
							"norg",
							"n",
							"<Leader>ng",
							"<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>"
						)
					end,
				},
			},

			["core.dirman"] = {
				config = {
					workspaces = {
						work = "~/notes/work",
						study = "~/notes/study",
					},
				},
			},

			["core.ui.calendar"] = {},

			["core.journal"] = {
				config = {
					workspace = "work",
				},
			},

			["core.export"] = {},

			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},

			["core.concealer"] = {
				config = {
					dim_code_blocks = {
						adaptative = false,
						conceal = true,
					},
				},
			},
		},
	},
}
