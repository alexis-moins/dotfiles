local utils = {}

---@class Options
---@field desc string
---@field noremap boolean
---@field silent boolean
---@field buffer boolean|number

---Convert options to a comprehensible format
---@param description string description of the mapping
---@param buffer? number the number of the buffer to apply the mapping to
---@return Options
function utils.convert_opts(description, buffer)
    local opts = { desc = description }

    if type(buffer) == 'number' then
        opts.buffer = buffer
    end

    return opts
end

---Wrapper around the nvim keymap api
---@param mode string|table the mode of the mapping
---@param keys string the keys used to trigger the mapping
---@param action function|string string or lua function to execute
---@param description string description of the mapping
---@param buffer? number the number of the buffer to apply the mapping to
function utils.map(mode, keys, action, description, buffer)
    vim.keymap.set(mode, keys, action,
        utils.convert_opts(description, buffer))
end

---Wrapper around the 'highlight! link' neovim command
---@param groups_a string|table
---@param group_b string
function utils.link(groups_a, group_b)
    vim.cmd.highlight {
        args = { 'link', groups_a, group_b },
        bang = true
    }
end

return utils
