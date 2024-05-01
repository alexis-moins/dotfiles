local add = MiniDeps.add

--
-- Fugitive
--
add("tpope/vim-fugitive")
keys.map("n", "<C-G>", "<cmd>Git<cr>", "Open git status")

--
-- mini.diff
--
add("echasnovski/mini.diff")
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "┃", change = "┃", delete = "┃" },
	},
})

-- Mappings
keys.map("n", "|d", MiniDiff.toggle_overlay, "Toggle diff overlay")
