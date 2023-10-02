-- [nfnl] Compiled from fnl/jev/utils.fnl by https://github.com/Olical/nfnl, do not edit.
local function is_nil(x)
  return ("nil" == type(x))
end
local function table_merge(a, b)
  return vim.tbl_deep_extend("force", a, b)
end
local function use_picker(name)
  return vim.cmd.Telescope({name})
end
return {["is-nil"] = is_nil, ["table-merge"] = table_merge, ["use-picker"] = use_picker}
