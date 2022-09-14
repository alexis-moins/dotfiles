local null_ls = require("null-ls")

-- Sources to register
local sources = {
    null_ls.builtins.formatting.autopep8,

    null_ls.builtins.formatting.prettier.with {
        extra_args = { "--no-config", "--tab-width", "4" }
    },
}

null_ls.setup { sources = sources }
