local hues = require("mini.hues")

local palette

if vim.o.background == "dark" then
	palette = hues.make_palette({
		background = "#2E3440",
		foreground = "#ECEFF4",

		saturation = "lowmedium",
	})
else
	palette = hues.make_palette({
		background = "#e7e7e7",
		foreground = "#1b1b1b",

		saturation = "mediumhigh",
	})
end

hues.apply_palette(palette)

vim.g.colors_name = "mini-nano"
