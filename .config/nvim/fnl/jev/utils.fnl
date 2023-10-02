(fn is-nil [x]
  "Returns true if the given value is nil."
  (= :nil (type x)))

(fn table-merge [a b]
  "Merges two tables recursively"
  (vim.tbl_deep_extend :force a b))

(fn use-picker [name]
  "Open the telescope picker with the given name"
  (vim.cmd.Telescope [name]))

{: is-nil : table-merge : use-picker}
