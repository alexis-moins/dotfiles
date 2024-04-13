local add = MiniDeps.add

local cmd = require("jev.core.autocmds")
local keys = require("jev.core.keymaps")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.diagnostic.config({
	float = { border = "rounded" },
	update_in_insert = true,
	virtual_text = false,
})

keys.map("n", "H", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, "Open diagnostics popup")

--
-- Configuration for the neovim LSP client
--
add("neovim/nvim-lspconfig")
local lspconfig = require("lspconfig")

--
-- Add documentation for nvim-lua api and plugins
--
add("folke/neodev.nvim")
require("neodev").setup()

cmd.autocmd("LspAttach", {
	group = cmd.augroup("LspConfig"),
	callback = function(args)
		local buffer = args.buf

		local function lsp(scope)
			return function()
				MiniExtra.pickers.lsp({ scope = scope })
			end
		end

		local function diagnostic(scope)
			return function()
				MiniExtra.pickers.diagnostic({ scope = scope })
			end
		end

		keys.maplocal("n", "<LocalLeader>gd", lsp("definition"), "Go to definitions", buffer)
		keys.maplocal("n", "<LocalLeader>gr", lsp("references"), "Go to references", buffer)
		keys.maplocal("n", "<LocalLeader>gt", lsp("type_definition"), "Go to type definitions", buffer)

		keys.maplocal("n", "<LocalLeader>w", diagnostic("all"), "Find diagnostic (all)", buffer)
		keys.maplocal("n", "<LocalLeader>d", diagnostic("current"), "Find diagnostic (current)", buffer)

		keys.maplocal("n", "<LocalLeader>rn", vim.lsp.buf.rename, "Rename symbol under the cursor", buffer)
		keys.maplocal("n", "<LocalLeader>ca", vim.lsp.buf.code_action, "Code actions", buffer)
		keys.maplocal("n", "<LocalLeader>lr", vim.cmd.LspRestart, "Restart Lsp client", buffer)
	end,
})

-- Mappings
keys.map("n", "<Leader>li", "<cmd>LspInfo<cr>", "Show LSP info")

--
-- lua-language-server
--
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},

			hint = { enable = true },
		},
	},
})

--
-- typescript
--
lspconfig.tsserver.setup({})

--
-- prisma
--
lspconfig.prismals.setup({})

--
-- golang
--
lspconfig.gopls.setup({})

--
-- vue
--
lspconfig.volar.setup({
	filetypes = {
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"json",
	},
})

--
-- tailwindcss
--
lspconfig.tailwindcss.setup({})

--
-- php
--
lspconfig.phpactor.setup({
	init_options = {
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = false,
	},
})

--
-- gleam
--
lspconfig.gleam.setup({})

--
-- Python
--
lspconfig.pyright.setup({})
