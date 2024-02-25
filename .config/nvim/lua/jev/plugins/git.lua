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
	on_attach = function()
		keys.maplocal("n", "[h", require("gitsigns").prev_hunk, "Previous git hunk", true)
		keys.maplocal("n", "]h", require("gitsigns").next_hunk, "Next git hunk", true)

		keys.maplocal({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select inner git hunk", true)
	end,
})

-- Mappings
keys.map("n", "|g", "<cmd>Gitsigns toggle_signs<cr>", "Toggle git signs")
