local add = MiniDeps.add

add({
	source = "hrsh7th/nvim-cmp",
	depends = {
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lua",

		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",

		"hrsh7th/cmp-cmdline",

		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
})

local cmp = require("cmp")

vim.opt.completeopt = { "menuone", "noselect" }

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:CmpBorder,Search:None",
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:CmpBorder",
		}),
	},

	mapping = {
		["<C-U>"] = cmp.mapping.scroll_docs(-4),
		["<C-D>"] = cmp.mapping.scroll_docs(4),
		["<C-P>"] = cmp.mapping.select_prev_item(),
		["<C-N>"] = function()
			if cmp.visible() then
				cmp.select_next_item()
			else
				cmp.complete()
			end
		end,
		["<C-Y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "path" },
	}, {
		{ name = "buffer", keyword_length = 2 },
	}),

	formatting = {
		expandable_indicator = true,

		format = function(entry, vim_item)
			local menu = {
				nvim_lua = "API",
				nvim_lsp = "LSP",
				luasnip = "Snippet",
				buffer = "Buffer",
				path = "Path",
			}

			vim_item.menu = menu[entry.source.name]
			return vim_item
		end,
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

--
-- Snippets
--
add("echasnovski/mini.snippets")
local snippet = require("mini.snippets")

snippet.setup({
	snippets = {
		-- Load custom file with global snippets first
		snippet.gen_loader.from_file(vim.fn.stdpath("config") .. "/snippets/global.json"),

		-- Load snippets based on current language by reading files from
		-- "snippets/" subdirectories from 'runtimepath' directories.
		snippet.gen_loader.from_lang(),
	},
})
