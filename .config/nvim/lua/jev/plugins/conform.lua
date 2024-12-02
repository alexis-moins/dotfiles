local add = MiniDeps.add

add("stevearc/conform.nvim")
local conform = require("conform")

local javacscript = { "prettier", "eslint", stop_at_first = true }

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = javacscript,
		json = javacscript,
		typescript = javacscript,
		typescriptreact = javacscript,
		php = { "pint" },
		ocaml = { "ocamlformat" },
	},
})

-- Mappings
keys.map("n", "=", function()
	conform.format({ async = true, lsp_format = "fallback" })
end, "Format file")
