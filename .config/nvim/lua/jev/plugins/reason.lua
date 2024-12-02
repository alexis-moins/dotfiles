local add = MiniDeps.add

add("reasonml-editor/vim-reason-plus")

-- Add ReasonML filetype
vim.filetype.add {
  extension = {
    re = "reason",
  },
}
