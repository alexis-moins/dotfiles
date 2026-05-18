vim.pack.add({
    gh("nvim-mini/mini.hues"),
    gh("nvim-mini/mini.icons"),
    gh("nvim-mini/mini.notify"),
    gh("nvim-mini/mini.extra"),
    gh("nvim-mini/mini.ai"),
    gh("nvim-mini/mini.completion"),
    gh("nvim-mini/mini.diff"),
    gh("nvim-mini/mini.files"),
    gh("nvim-mini/mini.hipatterns"),
    gh("nvim-mini/mini.move"),
    gh("nvim-mini/mini.operators"),
    gh("nvim-mini/mini.pairs"),
    gh("nvim-mini/mini.pick"),
    gh("nvim-mini/mini.surround"),
    gh("nvim-mini/mini.splitjoin"),
    gh("nvim-mini/mini.cmdline"),

    -- Other plugins
    {
        src = gh("nvim-treesitter/nvim-treesitter"),
        version = "main",
    },
    {
        src = gh("nvim-treesitter/nvim-treesitter-textobjects"),
        version = "main",
    },
})

-- Run `:TSUpdate`
Config.new_autocmd("PackChanged", nil, function(event)
    if (event.data.kind == "install" or event.data.kind == "update") and event.data.spec.name == "nvim-treesitter" then
        local ok = pcall(vim.cmd.TSUpdate)

        if not ok then
            vim.notify("TSUpdate failed!", vim.log.levels.WARN)
        end
    end
end)

-- Cmdline ====================================================================

require("mini.cmdline").setup()

-- Hues =======================================================================

vim.pack.add({ { src = gh('rose-pine/neovim'), name = 'rose-pine' } })

-- Once mini.hues is installed, we can set the colorscheme (which depends on it)
vim.cmd("colorscheme rose-pine-moon")

-- Icons ======================================================================

require("mini.icons").setup()

-- Mock 'nvim-tree/nvim-web-devicons' for plugins without 'mini.icons' support.
MiniIcons.mock_nvim_web_devicons()

-- Add LSP kind icons. Useful for 'mini.completion'.
MiniIcons.tweak_lsp_kind()

-- Notify =====================================================================

require("mini.notify").setup()

-- Extra ======================================================================

require("mini.extra").setup()

-- Textobjects ================================================================

local ts_ai = require("mini.ai").gen_spec.treesitter
local extra_ai = require("mini.extra").gen_ai_spec

require("mini.ai").setup({
    custom_textobjects = {
        -- Disable brackets alis in favor of builtin block textobject
        b = false,

        -- Make ar/ir select [] blocks
        r = { "%b[]", "^.().*().$" },

        -- Textobjects derived from mini.extra
        e = extra_ai.buffer(),
        L = extra_ai.line(),

        -- For more complicated textobjects that require structural awareness,
        -- use tree-sitter.
        f = ts_ai({ a = "@call.outer", i = "@call.inner" }),
        P = ts_ai({ a = "@parameter.outer", i = "@parameter.inner" }),
        c = ts_ai({ a = "@comment.outer", i = "@comment.inner" }),

        -- snake_case, camelCase, PascalCase...
        s = {
            {
                -- PascalCaseWords (or the latter part of camelCaseWords)
                "%u[%l%d]+%f[^%l%d]",

                -- start of camelCaseWords (just the `camel`)
                -- snake_case_words in lowercase
                -- regular lowercase words
                "%f[^%s%p][%l%d]+%f[^%l%d]",
                "^[%l%d]+%f[^%l%d]",

                -- SNAKE_CASE_WORDS in uppercase
                -- Snake_Case_Words in titlecase
                -- regular UPPERCASE words
                "%f[^%s%p][%a%d]+%f[^%a%d]",
                "^[%a%d]+%f[^%a%d]",
            },
            "^().*()$",
        },
    },
})

-- Surround ===================================================================

local ts_input = require("mini.surround").gen_spec.input.treesitter

require("mini.surround").setup({
    custom_surroundings = {
        -- Match builtin block ai textobjects
        ["b"] = {
            input = { "%b()", "^.().*().$" },
            output = { left = "(", right = ")" },
        },

        ["B"] = {
            input = { "%b{}", "^.().*().$" },
            output = { left = "{", right = "}" },
        },

        ["r"] = {
            input = { "%b[]", "^.().*().$" },
            output = { left = "[", right = "]" },
        },

        -- For more complicated textobjects that require structural awareness,
        -- use tree-sitter.
        f = {
            input = ts_input({ outer = "@call.outer", inner = "@call.inner" }),
        },
        P = {
            input = ts_input({ outer = "@parameter.outer", inner = "@parameter.inner" }),
        },
        c = {
            input = ts_input({ outer = "@comment.outer", inner = "@comment.inner" }),
        },
    },
})

-- Completion =================================================================

-- Customize post-processing of LSP responses for a better user experience.
-- Don't show 'Text' suggestions (usually noisy) and show snippets last.
local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }

local process_items = function(items, base)
    return MiniCompletion.default_process_items(items, base, process_items_opts)
end

require("mini.completion").setup({
    lsp_completion = {
        -- Without this config autocompletion is set up through `:h 'completefunc'`.
        -- Although not needed, setting up through `:h 'omnifunc'` is cleaner
        -- (sets up only when needed) and makes it possible to use `<C-u>`.
        source_func = "omnifunc",

        auto_setup = false,
        process_items = process_items,
    },

    -- Fallback to built-in completion
    fallback_action = "<C-x><C-n>",

    mappings = {
        force_twostep = "<C-n>",
    },
})

-- Set 'omnifunc' for LSP completion only when needed.
Config.new_autocmd("LspAttach", nil, function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
end)

-- Advertise to servers that Neovim now supports certain set of completion and
-- signature features through 'mini.completion'.
vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })

-- Diff =======================================================================

require("mini.diff").setup({
    view = {
        style = "sign",
        signs = { add = "┃", change = "┃", delete = "┃" },
    },
})

-- File Explorer ==============================================================

require("mini.files").setup({
    mappings = {
        go_in_plus = "<CR>",
    },
})

-- Hipatterns =================================================================

local hipatterns = require("mini.hipatterns")
local words = MiniExtra.gen_highlighter.words

hipatterns.setup({
    highlighters = {
        todo = words({ "TODO", "todo" }, "MiniHipatternsTodo"),
        note = words({ "NOTE", "note" }, "MiniHipatternsNote"),
        fixme = words({ "FIXME", "fixme" }, "MiniHipatternsFixme"),
        deprecate = words({ "DEPRECATE", "deprecate" }, "MiniHipatternsFixme"),

        -- Highlight hex color string (#aabbcc) with that color as a background
        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

-- Move =======================================================================

require("mini.move").setup({
    mappings = {
        -- Normal mode
        up = "<C-K>",
        down = "<C-J>",
        left = "<C-H>",
        right = "<C-L>",

        -- Visual mode
        line_up = "<C-K>",
        line_down = "<C-J>",
        line_left = "<C-H>",
        line_right = "<C-L>",
    },
})

-- Operators ==================================================================

require("mini.operators").setup()

-- Pairs ======================================================================

require("mini.pairs").setup({
    modes = {
        command = true,
    },
})

-- Pickers ====================================================================

require("mini.pick").setup()

-- Add custom 'staged' scope for `:Pick git_files`
MiniPick.registry.git_files = function(local_opts)
    if local_opts.scope == "staged" then
        return MiniPick.builtin.cli(
            { command = { "git", "diff", "--cached", "--name-only" } },
            { source = { name = "Git files (staged)" } }
        )
    end

    return MiniExtra.pickers.git_files(local_opts)
end

-- Splitjoin ==================================================================

require("mini.splitjoin").setup()

-- Tree-sitter ================================================================

-- Auto-install these language parsers
require("nvim-treesitter").install({
    "html",
    "css",
    "scss",

    "vue",
    "javascript",
    "typescript",
})
