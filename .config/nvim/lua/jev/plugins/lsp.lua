return {
	"neovim/nvim-lspconfig",
	lazy = false,

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"folke/neodev.nvim",
			ft = { "lua", "vim" },

			opts = {},
		},
	},

	keys = {
		{ "<Leader>lm", ":Mason<cr>", desc = "Open Mason", silent = true },
		{ "<Leader>li", ":LspInfo<cr>", desc = "Show Lsp info", silent = true },
	},

	config = function()
		-- Changing mason's UI
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "*",
					package_pending = "~",
					package_uninstalled = "-",
				},
				border = "rounded",
			},
		})

		require("mason-lspconfig").setup()

		-- Default function to run when attaching a client its LSP server
		local on_attach = function()
			local keymaps = require("jev.core.keymaps")

			local map = keymaps["map-local"]

			-- Don't map 'gc' or 'gb' because they are used by Comment.nvim
			map("n", "<Leader>gd", function()
				require("telescope.builtin").lsp_definitions()
			end, "Go to definition")

			map("n", "<Leader>gt", function()
				require("telescope.builtin").lsp_type_definitions()
			end, "Go to type definition")

			map("n", "<Leader>gi", "<cmd>Telescope lsp_implementations<cr>", "Go to LSP implementations(s)")
			map("n", "<Leader>gr", "<cmd>Telescope lsp_references<cr>", "Go to LSP reference(s)")

			map("n", "<Leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "Show document symbols")
			map("n", "<Leader>fw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Show workspace symbols")

			-- map("n", "<Leader>d", "<cmd>Telescope diagnostics bufnr=0<cr>", "Show buffer diagnostic")
			-- map("n", "<Leader>w", "<cmd>Telescope diagnostics<cr>", "Show workspace diagnostic")

			map("n", "<Leader>rn", vim.lsp.buf.rename, "Rename symbol under the cursor")
			map("n", "<Leader>ca", vim.lsp.buf.code_action, "Code actions")

			map("n", "<Leader>lr", "<cmd>LspRestart<cr>", "Restart Lsp client")
		end

		-- Capabilities from nvim-cmp
		local client_capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)

		require("mason-lspconfig").setup_handlers({
			-- Default handler called for each server installed with mason
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
			-- Server-specific config below
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},

							hint = {
								enable = true,
							},
						},
					},
				})
			end,

			["fennel_language_server"] = function()
				require("lspconfig").fennel_language_server.setup({
					capabilities = capabilities,
					on_attach = on_attach,

					root_dir = require("lspconfig.util").root_pattern("fnl", "lua"),
					single_file_support = true,

					filetypes = { "fennel" },

					settings = {
						fennel = {
							diagnostics = {
								globals = { "vim", "jit", "comment" },
							},

							hint = {
								enable = true,
							},

							workspace = {
								library = vim.api.nvim_list_runtime_paths(),
							},
						},
					},
				})
			end,
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.diagnostic.config({
			float = { border = "rounded" },
			update_in_insert = true,
			virtual_text = false,
		})

		vim.keymap.set("n", "H", function()
			vim.diagnostic.open_float(nil, { focus = false })
		end, {
			desc = "Open diagnostics popup",
		})
	end,
}
