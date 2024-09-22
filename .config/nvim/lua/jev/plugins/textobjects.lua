local add = MiniDeps.add

--
-- NOTE: This module must be loaded after mini.lua & treesitter.lua
--

--
-- mini.ai
--
add("echasnovski/mini.ai")

local gen_spec = require("mini.ai").gen_spec

require("mini.ai").setup({
	custom_textobjects = {
		B = MiniExtra.gen_ai_spec.buffer(),
		I = MiniExtra.gen_ai_spec.indent(),
		L = MiniExtra.gen_ai_spec.line(),
		N = MiniExtra.gen_ai_spec.number(),

		-- Requires treesitter & treesitter-textobjects
		F = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		P = gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
		c = gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }),
		s = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
	},
})
