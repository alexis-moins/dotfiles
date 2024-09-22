local add = MiniDeps.add

add("stevearc/conform.nvim")
local conform = require("conform")

local prettiers = { "prettier" }

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = prettiers,
		json = prettiers,
		typescript = prettiers,
		php = { "pint" },
		ocaml = { "ocamlformat" },
	},
})

-- Mappings
keys.map("n", "=", function()
	conform.format({ async = true, lsp_format = "fallback" })
end, "Format file")
