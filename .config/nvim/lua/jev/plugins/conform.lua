local add = MiniDeps.add
local keys = require("jev.core.keymaps")

add("stevearc/conform.nvim")
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		php = { "pint" },
	},
})

-- Mappings
keys.map("n", "=", function()
	conform.format({ async = true, lsp_fallback = true })
end, "Format file")
