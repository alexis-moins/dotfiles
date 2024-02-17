local add = MiniDeps.add

local map = JevKeys.map
local maplocal = JevKeys.maplocal

local augroup = JevCommands.augroup
local autocmd = JevCommands.autocmd

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.diagnostic.config({
	float = { border = "rounded" },
	update_in_insert = true,
	virtual_text = false,
})

map("n", "H", function() vim.diagnostic.open_float(nil, { focus = false }) end, "Open diagnostics popup")

-- Configuration for the neovim LSP client
add("neovim/nvim-lspconfig")
local lspconfig = require("lspconfig")

-- Add documentation for nvim-lua api and plugins
add("folke/neodev.nvim")
require('neodev').setup()

-- 
autocmd('LspAttach', {
  group = augroup('LspConfig'),
  callback = function(args)
    local buffer = args.buf

    local function lsp(scope)
        return function()
            MiniExtra.pickers.lsp({scope = scope})
        end
    end

    local function diagnostic(scope)
        return function()
            MiniExtra.pickers.disgnostic({scope = scope})
        end
    end

    maplocal("n", "<LocalLeader>gd", lsp("definition"), "Go to definitions", buffer)
    maplocal("n", "<LocalLeader>gr", lsp("references"), "Go to references", buffer)
    maplocal("n", "<LocalLeader>gt", lsp("type_definition"), "Go to type definitions", buffer)

    maplocal("n", "<LocalLeader>w", diagnostic("all"), "Find diagnostic (all)", buffer)
    maplocal("n", "<LocalLeader>d", diagnostic("current"), "Find diagnostic (current)", buffer)

    maplocal("n", "<LocalLeader>rn", vim.lsp.buf.rename, "Rename symbol under the cursor", buffer)
    maplocal("n", "<LocalLeader>ca", vim.lsp.buf.code_action, "Code actions", buffer)
    maplocal("n", "<LocalLeader>lr", vim.cmd.LspRestart, "Restart Lsp client", buffer)
  end,
})

map("n", "<Leader>li", "<cmd>LspInfo<cr>", "Show LSP info")

-- {{{ lua LSP
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },

            hint = { enable = true, },
        },
    },
})
-- }}}

-- vim: fdm=marker
