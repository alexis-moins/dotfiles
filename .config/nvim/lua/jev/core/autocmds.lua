-- Check if we need to reload the file when it changed
event.autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = event.augroup("Checktime"),
	command = "checktime",
})

-- Highlight on yank
event.autocmd("TextYankPost", {
	group = event.augroup("HighlightYank"),
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = 200,
			on_visual = false,
		})
	end,
})

-- resize splits if window got resized
event.autocmd({ "VimResized" }, {
	group = event.augroup("resize_splits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Don't display line numbers for certain file types
event.autocmd("FileType", {
	group = event.augroup("NoLineNumber"),
	pattern = { "fugitive", "qf", "gitcommit" },
	callback = function()
		opt.setlocal("number", false)
		opt.setlocal("relativenumber", false)
	end,
})

-- wrap and check for spell in text filetypes
event.autocmd("FileType", {
	group = event.augroup("WrapSpell"),
	pattern = { "gitcommit", "html", "norg", "markdown", "typescriptreact" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

event.autocmd("FileType", {
	group = event.augroup("FormatOptions"),
	pattern = "*",
	callback = function()
		opt.setlocal("formatoptions", "coqjl1")
	end,
})

-- Automatically add async to function definition
event.autocmd("FileType", {
	group = event.augroup("Javascript"),
	pattern = { "javascript", "typescript" },
	callback = function()
		keys.maplocal(
			"i",
			"t",
			require("jev.filetype.javascript").add_async,
			"Automatically add async to function definition"
		)
	end,
})

event.autocmd("TermOpen", {
	group = event.augroup("TermOptions"),
	callback = function()
		opt.setlocal("number", false)
		opt.setlocal("relativenumber", false)

		opt.setlocal("spell", false)
		vim.cmd("startinsert")
	end,
})

--
-- Don't display numbers and sign column in command window.
--
event.autocmd("CmdwinEnter", {
	group = event.augroup("CommandWindow"),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

--
-- Auto pairs for angle brackets
--
event.autocmd("FileType", {
	group = event.augroup("AutoPairs"),
	pattern = {
		"markdown",
		"html",
		"vue",
		"javascriptreact",
		"typescriptreact",
	},
	callback = function()
		MiniPairs.map_buf(0, "i", "<", { action = "open", pair = "<>", register = { cr = false } })
		MiniPairs.map_buf(0, "i", ">", { action = "close", pair = "<>", register = { cr = false } })
	end,
})
