"use strict";

// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
module.exports = {

    config: {
        // default font size in pixels for all tabs
        fontSize: 13,

        // font family with optional fallbacks
        fontFamily: '"Fira Code Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

        // font weight for bold characters: 'normal' or 'bold'
        fontWeightBold: 'normal',

        // line height as a relative unit
        lineHeight: 1.20,

        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: '#d8d8d8',

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
        selectionColor: 'rgba(248,28,229,0.3)',

        // border color (window, tabs)
        borderColor: '#333',

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
            green: '#62D196',
            yellow: '#C7C329',
            blue: '#0A2FC4',
            magenta: '#C839C5',
            cyan: '#20C5C6',
            white: '#CBE3E7',

            lightBlack: '#686868',
            lightRed: '#F48FB1',
            lightGreen: '#67F86F',
            lightYellow: '#FFFA72',
            lightBlue: '#6A76FB',
            lightMagenta: '#FD7CFC',
            lightCyan: '#68FDFE',
            lightWhite: '#CBE3E7',
            limeGreen: '#32CD32',
            lightCoral: '#F08080',
        },
        
        // for environment variables
        env: {},

        // Supported Options:
        //  1. 'SOUND' -> Enables the bell as a sound
        //  2. false: turns off the bell
        bell: false,

        // Whether to use the WebGL renderer. Set it to false to use canvas-based
        // rendering (slower, but supports transparent backgrounds)
        webGLRenderer: true,

        // keypress required for weblink activation: [ctrl|alt|meta|shift]
        // todo: does not pick up config changes automatically, need to restart terminal :/
        webLinksActivationKey: '',

        // if `false` (without backticks and without quotes), Hyper will use ligatures provided by some fonts
        disableLigatures: false,

        // set to true to disable auto updates
        disableAutoUpdates: false,
    },

    // a list of plugins to fetch and install from npm
    // format: [@org/]project[#version]
    // examples:
    //   `hyperpower`
    //   `@company/project`
    //   `project#1.0.1`
    plugins: [],

    // in development, you can create a directory under
    // `~/.hyper_plugins/local/` and include it here
    // to load it and avoid it being `npm install`ed
    localPlugins: [],

    keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
    },
};

//# sourceMappingURL=config-default.js.map
