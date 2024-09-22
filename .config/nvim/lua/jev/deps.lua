local package_path = vim.fn.stdpath("data") .. "/site"
local deps_path = package_path .. "/pack/deps/start/mini.deps"

if not vim.loop.fs_stat(deps_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.deps",
		deps_path,
	})

    vim.cmd.packadd('mini.deps | helptags ALL')
    vim.cmd.echo('"Installed `mini.deps`" | redraw')
end

require("mini.deps").setup({ path = { package = package_path } })
