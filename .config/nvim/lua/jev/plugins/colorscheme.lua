return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {
			highlight_groups = {
				StatusLine = { fg = "base", bg = "base" },
			},
		},
	},

	{
		"shaunsingh/nord.nvim",
		priority = 1000,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				custom_highlights = function(colors)
					return {
						Folded = { bg = colors.base },
						FoldColumn = { fg = colors.green },

						NormalFloat = { bg = colors.base },
						TabLine = { fg = colors.surface2, bg = colors.base },
						TabLineSel = { fg = colors.none, bg = colors.base },
						StatusLine = { fg = colors.base, bg = colors.base },
						CmpBorder = { fg = colors.blue },
						TelescopeMatching = { fg = colors.green, bg = "none" },
						TelescopeNormal = { fg = colors.surface2 },
						TelescopeBorder = { fg = colors.blue },
						TelescopeSelection = { fg = colors.text, bg = colors.base },
						TelescopeSelectionCaret = { fg = colors.red },
						TelescopePromptTitle = { fg = colors.green },
						TelescopePromptPrefix = { fg = colors.blue },
						Todo = {},
						MiniFilesBorderModified = { fg = colors.red },
						NonText = { fg = "#494d64" },

						MiniClueDescGroup = { fg = colors.red },
						MiniClueSeparator = { fg = colors.base },

						MiniClueNextKey = { fg = colors.mauve },
						MiniClueNextKeyWithPostKeys = { fg = colors.mauve },

						DiffDelete = { fg = colors.mantle, bg = "#48384b" },

						-- MiniTablineCurrent = { fg = colors.text },
						-- MiniTablineModifiedVisible = { fg = colors.blue },
					}
				end,
				integrations = {
					indent_blankline = {
						enabled = true,
						colored_indent_levels = true,
					},
					native_lsp = {
						enabled = true,
					},
				},
			})

			vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { link = "TabLine" })
			vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { link = "TabLine" })
			vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { link = "Normal" })

			vim.api.nvim_set_hl(0, "TabLineSel", { link = "Normal" })
			vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "TabLineSel" })
			vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "TabLine" })

			vim.api.nvim_set_hl(0, "WinbarNC", { link = "StatusLine" })

			vim.api.nvim_set_hl(0, "MiniPickNormal", { link = "Comment" })
			vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "Normal" })
			vim.api.nvim_set_hl(0, "MiniPickMatchRanges", { link = "String" })

			vim.api.nvim_set_hl(0, "Search", { fg = "#cad3f5", bold = true, italic = true })

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
