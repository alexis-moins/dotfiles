local function augroup(name)
	return vim.api.nvim_create_augroup("jev_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = 200,
			on_visual = false,
		})
	end,
})

-- close some filetypes with <q>
autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"help",
		"lspinfo",
		"man",
		"qf",
		"norg",
		"fugitive",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
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
	group = augroup("no_line_number"),
	pattern = { "fugitive", "qf", "gitcommit" },
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
	group = augroup("wrap_spell"),
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
		vim.opt_local.formatoptions = "qjl1"
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

autocmd("FileType", {
	group = augroup("prisma_commentstring"),
	callback = function()
		vim.opt_local.commentstring = "// %s"
	end,
})
