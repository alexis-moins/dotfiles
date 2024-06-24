local add = MiniDeps.add

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.diagnostic.config({
	float = { border = "rounded" },
	update_in_insert = true,
	-- virtual_text = false,
	jump = { float = true },
})

--
-- Mason
--
add({
	source = "williamboman/mason-lspconfig.nvim",
	depends = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
})

--
-- Add documentation for nvim-lua api and plugins
--
add("folke/neodev.nvim")
require("neodev").setup()

--
-- Mason
--
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright", "tsserver" },
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,

	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},

					hint = { enable = true },
				},
			},
		})
	end,
})

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

event.autocmd("LspAttach", {
	group = event.augroup("LspConfig"),
	callback = function(args)
		local buffer = args.buf

		-- vim.lsp.completion.enable(true, 0, buffer, { autotrigger = true })

		keys.maplocal("n", "<Leader>gd", lsp("definition"), "Go to definitions", buffer)
		keys.maplocal("n", "<Leader>gr", lsp("references"), "Go to references", buffer)
		keys.maplocal("n", "<Leader>gt", lsp("type_definition"), "Go to type definitions", buffer)

		keys.maplocal("n", "<Leader>w", diagnostic("all"), "Find diagnostic (all)", buffer)
		keys.maplocal("n", "<Leader>d", diagnostic("current"), "Find diagnostic (current)", buffer)

		keys.maplocal("n", "<Leader>lR", vim.cmd.LspRestart, "Restart Lsp client", buffer)

		keys.maplocal("n", "H", function()
			vim.diagnostic.open_float(nil, { focus = false })
		end, "Open diagnostics popup", buffer)
	end,
})

keys.map("n", "<Leader>li", "<cmd>LspInfo<cr>", "Show LSP info")
