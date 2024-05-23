local add = MiniDeps.add

--
-- Fugitive
--
add("echasnovski/mini-git")
require("mini.git").setup({})

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
