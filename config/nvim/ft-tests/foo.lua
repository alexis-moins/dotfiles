
local source = {}

source.new = function()
    return setmetatable({}, { __index = source })
end

source.get_keyword_pattern = function()
    return [=[[^[:blank:]]*]=]
end

-- This is a lua comment
-- @param {String | Array}
-- @return a boolean
source.get_trigger_character = function()
    return { '$', ':', '!', '&', ' ' }
end

vim.api.keymap.testing()
