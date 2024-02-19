local add = MiniDeps.add
local keys = require("jev.core.keymaps")

--
-- Fugitive
--
add("tpope/vim-fugitive")
keys.map("n", "<Leader>gs", "<cmd>Git<cr>", "Open git status")

---
--- Gitsigns
---
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
		keys.maplocal("n", "[h", require("gitsigns").prev_hunk, "Previous git hunk", true)
		keys.maplocal("n", "]h", require("gitsigns").next_hunk, "Next git hunk", true)

		keys.maplocal({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select inner git hunk", true)
	end,
})
