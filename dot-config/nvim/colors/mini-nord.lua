local hues = require("mini.hues")

local palette

if vim.o.background == "dark" then
	palette = hues.make_palette({
		background = "#2e3440",
		foreground = "#d8dee9",

		saturation = "lowmedium",
	})
else
	palette = hues.make_palette({
		background = "",
		foreground = "",

		saturation = "mediumhigh",
	})
end

hues.apply_palette(palette)

vim.g.colors_name = "mini-nord"
