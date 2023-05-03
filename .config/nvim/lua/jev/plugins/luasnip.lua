local plugin = {
    "L3MON4D3/LuaSnip",
    lazy = true,
}

plugin.config = function()
    local ls = require("luasnip")

    ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
    })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, { silent = true })

    vim.keymap.set("i", "<C-l>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, { silent = true })

    ls.add_snippets("norg", {
        ls.parser.parse_snippet("code", "@code $1\n@end"),
    })

    ls.add_snippets("python", {
        ls.parser.parse_snippet("log", "print(f'\\n{$1=}\\n')"),
    })
end

return plugin
