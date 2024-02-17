local map = JevKeys.map
local add = MiniDeps.add

-- {{{ mini.pick
add("echasnovski/mini.pick")

require("mini.pick").setup({
	source = {
		show = require("mini.pick").default_show,
	},

	mappings = {
		refine = "<C-J>",
		choose_marked = "<C-Q>",
	},
})

-- Use mini.pick as the default selector in vim
vim.ui.select = MiniPick.ui_select

map("n", "<Leader><Space>", MiniPick.builtin.files, "Find files")
map("n", "<Leader>z", MiniPick.builtin.resume, "Resume last picker")

map("n", "<Leader>fb", MiniPick.builtin.buffers, "Find buffers")
map("n", "<Leader>fh", MiniPick.builtin.help, "Find help")
map("n", "<Leader>fg", MiniPick.builtin.grep_live, "Find content")
-- }}}

-- {{{ mini.pairs
add("echasnovski/mini.pairs")

require("mini.pairs").setup({
    modes = { insert = true, command = true, terminal = true },
})
-- }}}

-- {{{ mini.files
add("echasnovski/mini.files")

require("mini.files").setup({
 			mappings = {
 				go_in = "L",
 				go_in_plus = "<CR>",

 				go_out = "H",
 				go_out_plus = "",
 			},
})

map("n", "-", MiniFiles.open, "Open file explorer")
-- }}}

-- {{{ mini.notify
add("echasnovski/mini.notify")

require("mini.notify").setup({
    content = {
        -- Use notification message as is
        format = function(notif)
            return notif.msg
        end,
    },

    window = {
        config = {
            border = "rounded",
        },
    },
})

-- Use mini.notify for general notification
vim.notify = MiniNotify.make_notify()
-- }}}

-- {{{ mini.tabline
add("echasnovski/mini.tabline")

require("mini.tabline").setup()
-- }}}

-- {{{ mini.comment
add("echasnovski/mini.comment")

require("mini.comment").setup({
    options = { ignore_blank_line = true }
})
-- }}}

-- {{{ mini.move
add("echasnovski/mini.move")

require("mini.move").setup({
    mappings = {
    	-- Normal mode
    	down = "<C-J>",
    	up = "<C-K>",
        left = "<C-H>",
    	right = "<C-L>",

    	-- Visual node
    	line_down = "<C-J>",
    	line_up = "<C-K>",
    	line_left = "<C-H>",
    	line_right = "<C-L>",
    },
})
-- }}}

-- {{{ Extra pickers
add("echasnovski/mini.extra")

require("mini.extra").setup()
-- }}}

-- return {
--
-- 	
--
-- 	{
-- 		"echasnovski/mini.surround",
-- 		event = "VeryLazy",
-- 		opts = {
-- 			custom_surroundings = {
-- 				["b"] = { output = { left = "(", right = ")" } },
-- 				["B"] = { output = { left = "{", right = "}" } },
-- 				["r"] = { output = { left = "[", right = "]" } },
-- 			},
-- 			silent = true,
-- 		},
-- 	},
--
--
-- 	{
-- 		"echasnovski/mini.ai",
-- 		event = "VeryLazy",
-- 		opts = {
-- 			silent = true,
-- 		},
-- 	},
--
-- 	{
-- 		"echasnovski/mini.bracketed",
-- 		event = "VeryLazy",
-- 		opts = {
-- 			treesitter = { suffix = "" },
-- 			oldfile = { suffix = "" },
-- 		},
-- 	},
--
-- 	{
-- 		"echasnovski/mini.jump",
-- 		event = "VeryLazy",
-- 		opts = {
-- 			mappings = {
-- 				repeat_jump = ",",
-- 			},
--
-- 			delay = {
-- 				highlight = 0,
-- 			},
-- 		},
-- 	},
--
-- 	{
-- 		"echasnovski/mini.splitjoin",
-- 		keys = { "gS" },
-- 		opts = {},
-- 	},
--
-- 	{
-- 		"echasnovski/mini.files",
-- 		event = "BufEnter",
-- 		opts = {
-- 			mappings = {
-- 				go_in = "L",
-- 				go_in_plus = "<CR>",
--
-- 				go_out = "H",
-- 				go_out_plus = "",
-- 			},
-- 		},
--
-- 		keys = {
-- 			{
-- 				"-",
-- 				function()
-- 					require("mini.files").open(vim.api.nvim_buf_get_name(0))
-- 				end,
-- 				desc = "Open file explorer",
-- 			},
-- 		},
-- 	},
--
-- 	{
-- 		"echasnovski/mini.operators",
-- 		event = "BufEnter",
-- 		opts = {},
-- 	},
--
--
-- 	{
-- 		"echasnovski/mini.sessions",
-- 		opts = {
-- 			verbose = { read = true },
-- 		},
-- 	},
--
-- 	{
-- 		"echasnovski/mini.extra",
-- 		opts = {},
-- 	},
--
-- 	{
--
-- 	{
-- 		"echasnovski/mini.visits",
-- 		opts = {},
-- 	},
--
-- 	{
-- 		"echasnovski/mini.colors",
-- 		opts = {},
-- 	},
--
-- 	{
-- 		"echasnovski/mini.hipatterns",
-- 		opts = function()
-- 			return {
-- 				highlighters = {
-- 					hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
-- 				},
-- 			}
-- 		end,
-- 	},
--

-- vim: fdm=marker
