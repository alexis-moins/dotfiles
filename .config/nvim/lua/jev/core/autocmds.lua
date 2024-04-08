local function augroup(name)
	return vim.api.nvim_create_augroup("Jev" .. name, { clear = true })
end

local keys = require("jev.core.keymaps")
local autocmd = vim.api.nvim_create_autocmd

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("Checktime"),
	command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank"),
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = 200,
			on_visual = false,
		})
	end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Don't display line numbers for certain filetypes
autocmd("FileType", {
	group = augroup("NoLineNumber"),
	pattern = { "fugitive", "qf", "gitcommit" },
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
	group = augroup("WrapSpell"),
	pattern = { "gitcommit", "html", "norg", "markdown", "typescriptreact" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

autocmd("FileType", {
	group = augroup("format_options"),
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions = "coqjl1"
	end,
})

autocmd("TermOpen", {
	group = augroup("auto_term_insert_mode"),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.cmd.startinsert()
	end,
})

--
-- Don't display numbers and sign column in command window.
--
autocmd("CmdwinEnter", {
	group = augroup("CommandWindow"),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

--
-- Auto pairs for angle brackets
--
autocmd("FileType", {
	group = augroup("AutoPairs"),
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

--
-- Templates
--
local template_group = augroup("Templates")

local read_template = function(template_name)
	return function()
		vim.cmd("0r ~/.config/nvim/templates/" .. template_name)
		keys.maplocal("n", "<Leader>i", "cgn", "Change next template placeholder", 0)

		-- set search register to @@
		vim.cmd('let @/ = "@@"')
	end
end

--
-- React
--
autocmd("BufNewFile", {
	group = template_group,
	pattern = { "*.jsx", "*.tsx" },
	callback = read_template("react"),
})

--
-- Vue
--
autocmd("BufNewFile", {
	group = template_group,
	pattern = { "*.vue" },
	callback = read_template("vue"),
})

local helpers = {
	augroup = augroup,
	autocmd = autocmd,
}

return helpers
