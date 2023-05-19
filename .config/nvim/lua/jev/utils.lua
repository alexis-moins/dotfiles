local utils = {}

---Wrapper around the nvim keymap api
---@param mode string|table the mode of the mapping
---@param keys string the keys used to trigger the mapping
---@param action function|string string or lua function to execute
---@param description string description of the mapping
---@param opts? string[] optional options
function utils.map(mode, keys, action, description, opts)

    local default_opts = {
        silent = true,
        desc = description
    }

    local _opts = vim.tbl_deep_extend('force', default_opts, opts or {})
    vim.keymap.set(mode, keys, action, _opts)
end

return utils
