local hues = require("mini.hues")

local palette

if vim.o.background == "dark" then
	palette = hues.make_palette({
		-- Base
		background = "#1f1d2e",
		-- Text
		foreground = "#e0def4",

		saturation = "lowmedium",
	})

	-- Love
	palette.red = "#eb6f92"

	-- Gold
	palette.orange = "#f6c177"

	-- Rose
	palette.yellow = "#ebbcba"

	-- Foam
	palette.azure = "#9ccfd8"

	-- Pine
	palette.blue = "#31748f"

	-- Iris
	palette.purple = "#c4a7e7"
else
	palette = hues.make_palette({
		-- Base
		background = "#faf4ed",
		-- Text
		foreground = "#575279",

		saturation = "mediumhigh",
	})

	-- Love
	palette.red = "#b4637a"

	-- Gold
	palette.orange = "#ea9d34"

	-- Rose
	palette.yellow = "#d7827e"

	-- Foam
	palette.azure = "#56949f"

	-- Pine
	palette.blue = "#286983"

	-- Iris
	palette.purple = "#907aa9"
end

hues.apply_palette(palette)

vim.g.colors_name = "mini-rosepine"
