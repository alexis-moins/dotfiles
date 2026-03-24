local hues = require("mini.hues")

local palette

if vim.o.background == "dark" then
	palette = hues.make_palette({
		background = "#1e1e2e",
		foreground = "#cdd6f4",

		saturation = "lowmedium",
	})
else
	palette = hues.make_palette({
		background = "#eff1f5",
		foreground = "#4c4f69",

		saturation = "mediumhigh",
	})
end

hues.apply_palette(palette)

vim.g.colors_name = "mini-mocha"
