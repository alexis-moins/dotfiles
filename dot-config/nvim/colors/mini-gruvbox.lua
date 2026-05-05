local hues = require("mini.hues")

local palette

if vim.o.background == "dark" then
	palette = hues.make_palette({
		background = "#282828",
		foreground = "#ebdbb2",

		saturation = "lowmedium",
	})
else
	palette = hues.make_palette({
		background = "#fbf1c7",
		foreground = "#3c3836",

		saturation = "mediumhigh",
	})
end

hues.apply_palette(palette)

vim.g.colors_name = "mini-gruvbox"
