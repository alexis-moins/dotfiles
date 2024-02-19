local add = MiniDeps.add

local cmd = require("jev.core.autocmds")
local keys = require("jev.core.keymaps")

--
-- mini.pick
--
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

-- Mappings
keys.map("n", "<Leader><Space>", MiniPick.builtin.files, "Find files")
keys.map("n", "<Leader>z", MiniPick.builtin.resume, "Resume last picker")
keys.map("n", "<Leader>fb", MiniPick.builtin.buffers, "Find buffers")
keys.map("n", "<Leader>fh", MiniPick.builtin.help, "Find help")
keys.map("n", "<Leader>fg", MiniPick.builtin.grep_live, "Find content")

--
-- mini.pairs
--
add("echasnovski/mini.pairs")
require("mini.pairs").setup({
	modes = { insert = true, command = true, terminal = true },
})

--
-- mini.files
--
add("echasnovski/mini.files")
require("mini.files").setup({
	mappings = {
		go_in = "L",
		go_in_plus = "<CR>",

		go_out = "H",
		go_out_plus = "",
	},
})

-- Mappings
keys.map("n", "-", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, "Open file explorer")

--
-- mini.notify
--
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

-- Autocommands
local group = cmd.augroup("MacroNotification")

cmd.autocmd("RecordingEnter", {
	group = group,
	callback = function()
		MiniNotify.add("Recording @" .. vim.fn.reg_recording())
	end,
})

cmd.autocmd("RecordingLeave", { group = group, callback = MiniNotify.clear })

--
-- mini.tabline
--
add("echasnovski/mini.tabline")
require("mini.tabline").setup()

--
-- mini.comment
--
add("echasnovski/mini.comment")
require("mini.comment").setup({
	options = { ignore_blank_line = true },
})

--
-- mini.move
--
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

--
-- mini.extra
--
add("echasnovski/mini.extra")
require("mini.extra").setup()

-- Mappings
keys.map("n", "<Leader>fc", function() MiniExtra.pickers.history({ scope = ":" }) end, "Filter command history")
keys.map("n", "<Leader>/", function() MiniExtra.pickers.buf_lines({ scope = "current" }) end, "Find lines")


--
-- mini.surrounds
--
add("echasnovski/mini.surround")
require("mini.surround").setup({
	custom_surroundings = {
		["b"] = { output = { left = "(", right = ")" } },
		["B"] = { output = { left = "{", right = "}" } },
		["r"] = { output = { left = "[", right = "]" } },
	},
	silent = true,
})

--
-- mini.ai
--
add("echasnovski/mini.ai")
require("mini.ai").setup()

--
-- mini.bracketed
--
add("echasnovski/mini.bracketed")
require("mini.surround").setup({
	treesitter = { suffix = "" },
	oldfile = { suffix = "" },
})

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
-- mini.splitjoin
--
add("echasnovski/mini.splitjoin")
require("mini.splitjoin").setup()

--
-- mini.operators
--
add("echasnovski/mini.operators")
require("mini.operators").setup()

--
-- mini.sessions
--
add("echasnovski/mini.sessions")
require("mini.sessions").setup({ verbose = { read = true } })

--- Wrapper around mini.sessions functions. Returns a function that
--- behaves differently based on the given scope.
---
---@param scope "local"|"write"|"read"|"delete"
---@return function
local function session(scope)
	return function()
		if scope == "local" then
			MiniSessions.write("Session.vim")
		else
			MiniSessions.select(scope)
		end
	end
end

-- Mappings
keys.map("n", "<Leader>sl", session("local"), "Write a local session")
keys.map("n", "<Leader>sw", session("write"), "Write a session")
keys.map("n", "<Leader>sr", session("read"), "Read a session")
keys.map("n", "<Leader>sd", session("delete"), "Delete a session")

--
-- mini.visits
--
add("echasnovski/mini.visits")
require("mini.visits").setup()

local LABEL = "core"

--- Wrapper around mini.visits functions. Returns a function that
--- behaves differently based on the given action.
---
---@param action "add"|"remove"
---@return function
local function label(action)
	return function()
		if action == "add" then
			MiniVisits.add_label(LABEL)
		elseif action == "remove" then
			MiniVisits.remove_label(LABEL)
		end
	end
end

-- Mappings
keys.map("n", "<Leader>la", label("add"), "Add to " .. LABEL)
keys.map("n", "<Leader>lr", label("remove"), "Remove from " .. LABEL)

keys.map("n", "<Leader>v", function()
	MiniVisits.select_path(nil, { filter = LABEL })
end, "Find labels (current)")
keys.map("n", "<Leader>V", function()
	MiniVisits.select_path("", { filter = LABEL })
end, "Find labels (all)")

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
