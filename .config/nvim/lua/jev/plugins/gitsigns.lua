local add = MiniDeps.add
local maplocal = JevKeys.maplocal

add("lewis6991/gitsigns.nvim")

require("gitsigns").setup({
	signs = {
		add = { text = "▍" },
		change = { text = "▍" },
		delete = { text = "▍" },
		topdelete = { text = "▍" },
		changedelete = { text = "▍" },
		untracked = { text = "" },
	},

	current_line_blame_opts = {
		delay = 150,
	},

	on_attach = function()
		maplocal("n", "[h", require("gitsigns").prev_hunk, "Previous git hunk")
		maplocal("n", "]h", require("gitsigns").next_hunk, "Next git hunk")

		maplocal({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

-- vim: fdm=marker
