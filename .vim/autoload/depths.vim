
let s:palette = {}

let s:palette.red		= [ "#FF1C73", 1 ]
let s:palette.green		= [ "#87FFAF", 2 ]
let s:palette.yellow	= [ "#FFB100", 3 ]
let s:palette.blue		= [ "#79B8FF", 4 ]
let s:palette.magenta	= [ "#AF86FF", 5 ]
let s:palette.cyan		= [ "#5FCCFF", 6 ]
let s:palette.white		= [ "#E9E9E9", 7 ]

let s:palette.visual		= [ "#19202A", 8 ]
let s:palette.lightRed		= [ "#292F37", 9 ]
let s:palette.lightGreen	= [ "#87FFAF", 10 ]
let s:palette.lightYellow	= [ "#D7D76B", 11 ]
let s:palette.lightBlue		= [ "#C8E1FF", 12 ]
let s:palette.lightMagenta	= [ "#AF86FF", 13 ]
let s:palette.lightCyan		= [ "#5FCCFF", 14 ]
let s:palette.grey			= [ "#5A677A", 15 ]

let s:palette.background	= [ "#19202A", 0   ]
let s:palette.none			= [ "NONE", "NONE" ]

func! depths#ColorPalette()
    return s:palette
endfunc
