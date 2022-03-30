"use strict";

module.exports = {

    config: {

        // Default font size
        fontSize: 13,

        // Font family with optional fallbacks
        fontFamily: '"Fira Code", Menlo',

        // Font weight for bold characters
        fontWeightBold: 'normal',

        lineHeight: 1.25,

        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: '#D9D9D9',

        // terminal text color under BLOCK cursor
        cursorAccentColor: '#000',

        // Define the cursor shape (BEAM, UNDERLINE or BLOCK)
        cursorShape: 'BEAM',

        // Let the cursor blink
        cursorBlink: true,

        // color of the text
        foregroundColor: '#D9D9D9',

        // terminal background color
        // opacity is only supported on macOS
        backgroundColor: '#212533',

        // terminal selection color
        selectionColor: '#2E3447',

        // border color (window, tabs)
        borderColor: '#212533',

        // custom CSS to embed in the main window
        css: '',

        // custom CSS to embed in the terminal window
        termCSS: '',

        // set custom startup directory (must be an absolute path)
        workingDirectory: '',

        // if you're using a Linux setup which show native menus, set to false
        // default: `true` on Linux, `true` on Windows, ignored on macOS
        showHamburgerMenu: '',

        // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
        // additionally, set to `'left'` if you want them on the left, like in Ubuntu
        // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
        showWindowControls: '',

        // custom padding (CSS format, i.e.: `top right bottom left`)
        padding: '5px 5px',

        // the full list. if you're going to provide the full color palette,
        // including the 6 x 6 color cubes and the grayscale map, just provide
        // an array here instead of a color map object
        colors: {
            black: '#212533',
            red: '#FF638D',
            green: '#65E6B3',
            yellow: '#FFA986',
            blue: '#C8E1FF',
            magenta: '#C3A0FF',
            cyan: '#7FF1FF',
            white: '#D9D9D9',

            lightBlack: '#5B667F',
            lightRed: '#FF638D',
            lightGreen: '#65E6B3',
            lightYellow: '#FFA986',
            lightBlue: '#C8E1FF',
            lightMagenta: '#C3A0FF',
            lightCyan: '#7FF1FF',
            lightWhite: '#2E3447',
        },
        // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
        // if left empty, your system's login shell will be used by default
        //
        // Windows
        // - Make sure to use a full path if the binary name doesn't work
        // - Remove `--login` in shellArgs
        //
        // Windows Subsystem for Linux (WSL) - previously Bash on Windows
        // - Example: `C:\\Windows\\System32\\wsl.exe`
        //
        // Git-bash on Windows
        // - Example: `C:\\Program Files\\Git\\bin\\bash.exe`
        //
        // PowerShell on Windows
        // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
        //
        // Cygwin
        // - Example: `C:\\cygwin64\\bin\\bash.exe`
        shell: '',
        // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
        // by default `['--login']` will be used
        shellArgs: ['--login'],
        // for environment variables
        env: {},

        // 
        bell: false,

        // An absolute file path to a sound file on the machine.
        // bellSoundURL: '/path/to/sound/file',
        // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
        copyOnSelect: false,
        // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
        defaultSSHApp: true,
        // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
        // selection is present (`true` by default on Windows and disables the context menu feature)
        quickEdit: false,
        // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
        // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
        // (inside tmux or vim with mouse mode enabled for example).
        macOptionSelectionMode: 'vertical',

        // keypress required for weblink activation: [ctrl|alt|meta|shift]
        // todo: does not pick up config changes automatically, need to restart terminal :/
        webLinksActivationKey: '',

        // if `false` (without backticks and without quotes), Hyper will use ligatures provided by some fonts
        disableLigatures: false,

        // set to true to enable screen reading apps (like NVDA) to read the contents of the terminal
        screenReaderMode: false,
        // set to true to preserve working directory when creating splits or tabs
        preserveCWD: true,
        // for advanced config flags please refer to https://hyper.is/#cfg
    },

    // List of plugins to fetch and install from npm
    plugins: [],

    // List of local plugins (under ~/.hyper_plugins/local/)
    localPlugins: ['hyper-depths'],

};
