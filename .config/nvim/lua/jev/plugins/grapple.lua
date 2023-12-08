return {
	"cbochs/grapple.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	cmd = "Grapple",
	opts = {},

	keys = {
		{ "<Leader>gg", ":GrappleToggle<cr>", desc = "Toggle tag for buffer", silent = true },
		{ "<Leader>gp", ":GrapplePopup tags<cr>", desc = "Open Grapple tag popup", silent = true },

		{ "[g", ":GrappleCycle backward<cr>", desc = "Go to previous Grapple tag", silent = true },
		{ "]g", ":GrappleCycle forward<cr>", desc = "Go to next Grapple tag", silent = true },

		{ "<Leader>1", ":GrappleSelect key=1<cr>", desc = "Go to Grapple tag #1", silent = true },
		{ "<Leader>2", ":GrappleSelect key=2<cr>", desc = "Go to Grapple tag #2", silent = true },
		{ "<Leader>3", ":GrappleSelect key=3<cr>", desc = "Go to Grapple tag #3", silent = true },
		{ "<Leader>4", ":GrappleSelect key=4<cr>", desc = "Go to Grapple tag #4", silent = true },
	},
}
