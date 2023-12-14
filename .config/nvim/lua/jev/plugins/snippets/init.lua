return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",

	config = function()
		local ls = require("luasnip")

		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})

		vim.keymap.set({ "i", "s" }, "<Tab>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		vim.keymap.set("i", "<C-l>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })

		require("luasnip.loaders.from_vscode").load({
			paths = { "/Users/alexis/.config/nvim/lua/jev/plugins/snippets/snippets.json" },
		})
	end,
}
