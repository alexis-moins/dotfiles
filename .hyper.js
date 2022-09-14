"use strict";

// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
module.exports = {

    config: {
        // default font size in pixels for all tabs
        fontSize: 13,

        // font family with optional fallbacks
        fontFamily: '"FiraCode Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

        // font weight for bold characters: 'normal' or 'bold'
        fontWeightBold: 'normal',

        // line height as a relative unit
        lineHeight: 1.20,
        lineWidth: 1.20,

        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: '#CBE3E7',

        // terminal text color under BLOCK cursor
        cursorAccentColor: '#000',

        // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
        cursorShape: 'BEAM',

        // set to `true` (without backticks and without quotes) for blinking cursor
        cursorBlink: true,

        // color of the text
        foregroundColor: '#CBE3E7',

        // terminal background color
        // opacity is only supported on macOS
        backgroundColor: '#1e1c31',

        // terminal selection color
        selectionColor: '#2D2B40',

        // border color (window, tabs)
        borderColor: '#1e1c31',

        // custom CSS to embed in the main window
        css: '',

        // custom CSS to embed in the terminal window
        termCSS: '',

        // custom padding (CSS format, i.e.: `top right bottom left`)
        padding: '0px 0px 5px 5px',

        // the full list. if you're going to provide the full color palette,
        // including the 6 x 6 color cubes and the grayscale map, just provide
        // an array here instead of a color map object
        colors: {
            black: '#1e1c31',
            red: '#F48FB1',
            green: '#A1EFD3',
            yellow: '#FFE6B3',
            blue: '#91DDFF',
            magenta: '#D4BFFF',
            cyan: '#87DFEB',
            white: '#CBE3E7',

            lightBlack: '#585273',
            lightRed: '#F48FB1',
            lightGreen: '#A1EFD3',
            lightYellow: '#FFE6B3',
            lightBlue: '#91DDFF',
            lightMagenta: '#D4BFFF',
            lightCyan: '#87DFEB',
            lightWhite: '#CBE3E7',
        },
        
        bell: false,

        webGLRenderer: true,

        // if `false` (without backticks and without quotes), Hyper will use ligatures provided by some fonts
        disableLigatures: false,

        // set to true to disable auto updates
        disableAutoUpdates: false,
    },

    plugins: [],

    localPlugins: [],
};

//# sourceMappingURL=config-default.js.map
