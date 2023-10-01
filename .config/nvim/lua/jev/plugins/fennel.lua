return {

    {
        "Olical/nfnl",
        ft = 'fennel'
    },

    {
        "Olical/conjure",
        ft = "fennel",

        config = function()
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
    }

}
