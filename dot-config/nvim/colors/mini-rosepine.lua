local hues = require("mini.hues")

local palette

if vim.o.background == "dark" then
    palette = hues.make_palette({
        background = "#1f1d2e",
        foreground = "#e0def4",

        saturation = "lowmedium",
    })

    palette.red = "#eb6f92"    -- Love
    palette.orange = "#f6c177" -- Gold
    palette.yellow = "#ebbcba" -- Rose
    palette.azure = "#9ccfd8"  -- Foam
    palette.blue = "#31748f"   -- Pine
    palette.purple = "#c4a7e7" -- Iris
else
    palette = hues.make_palette({
        background = "#faf4ed",
        foreground = "#575279",

        saturation = "medium",
    })

    palette.red = "#b4637a"    -- Love
    palette.orange = "#ea9d34" -- Gold
    palette.yellow = "#d7827e" -- Rose
    palette.azure = "#56949f"  -- Foam
    palette.blue = "#286983"   -- Pine
    palette.purple = "#907aa9" -- Iris
end

hues.apply_palette(palette)

vim.g.colors_name = "mini-rosepine"
