local hues = require("mini.hues")

local palette

if vim.o.background == "dark" then
	palette = hues.make_palette({
		background = "#1e1e2e",
		foreground = "#cdd6f4",

		saturation = "mediumhigh",
	})

    palette.red = "#f38ba8"    -- Red
    palette.orange = "#fab387" -- Peach
    palette.yellow = "#f9e2af" -- Yellow
    palette.azure = "#89dceb"  -- Sky
    palette.blue = "#89b4fa"   -- Blue
    palette.purple = "#cba6f7" -- Mauve
else
	palette = hues.make_palette({
		background = "#eff1f5",
		foreground = "#4c4f69",

		saturation = "high",
	})
end

hues.apply_palette(palette)

vim.g.colors_name = "mini-mocha"
