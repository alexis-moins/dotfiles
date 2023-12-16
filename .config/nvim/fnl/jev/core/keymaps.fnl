(fn map [modes lhs rhs desc]
  "Creates a neovim mapping with the given description."
  (let [opts {: desc}]
    (vim.keymap.set modes lhs rhs opts)))

(fn map-local [modes lhs rhs desc]
  "Create a buffer local neovim mapping with description"
  (let [opts {: desc :buffer true}]
    (vim.keymap.set modes lhs rhs opts)))

(map :i :jk :<C-C> "Leave insert mode")

(map :n :<BS> vim.cmd.nohlsearch "Clear search highlighting")
(map :n :<Leader>so vim.cmd.source "Source current file")

(map :n :<Leader>o vim.cmd.only "Close all splits")

(map :n :<Leader>- vim.cmd.bdelete "Delete the current buffer")
(map :n :<Leader>q vim.cmd.copen "Open/focus the quickfix list")

(map [:n :v] :j :gj "Move down (respects wrap)")
(map [:n :v] :k :gk "Move up (respects wrap)")

(map :n :Q "@qj" "Play macro")
(map :x :Q "<cmd>norm @q<cr>" "Play macro")

;; Stay in place
(map :n :J "mzJ`z" "Join line below without moving cursor")

;; Easier line navigation
(map :n :L "$" "Go to the end of the line")

(map :n "]]" "<cmd>edit #<cr>" "Edit alternate file")

;; Center scroll
(map :n :<C-U> :<C-U>zz "Scroll upwards (center)")
(map :n :<C-D> :<C-D>zz "Scroll downwards (center)")

;; Center search
(map :n :n :nzz "Repeat last search (center)")
(map :n :N :Nzz "Repeat last search in opposite direction (center)")

(map [:n :x] :gy "\"+y" "Copy (+register)")

;; Paste using + register
(map [:n :x] :gp "\"+p" "Paste after cursor (+register)")
(map [:n :x] :gP "\"+P" "Paste before cursor (+register)")

;; Sessions (mini.sessions)
(map :n :<Leader>ss
     #(vim.ui.input {:prompt "Session name: "} #(_G.MiniSessions.write $1))
     "Write a new session")

(map :n :<Leader>sw #(_G.MiniSessions.select :write) "Write a session")
(map :n :<Leader>sl #(_G.MiniSessions.write :Session.vim)
     "Write a local session")

(map :n :<Leader>sr #(_G.MiniSessions.select :read) "Read a session")
(map :n :<Leader>sd #(_G.MiniSessions.select :delete) "Delete a session")

;; Pickers (mini.pick)
(map :n :<Leader><Space> #(_G.MiniPick.builtin.files) "Find files")
(map :n :<Leader>z #(_G.MiniPick.builtin.resume) "Resume last picker")

(map :n :<Leader>fb #(_G.MiniPick.builtin.buffers) "Find buffers")
(map :n :<Leader>fh #(_G.MiniPick.builtin.help) "Find help")
(map :n :<Leader>fg #(_G.MiniPick.builtin.grep_live) "Find content")

;; Additional pickers (mini.extra)
(map :n :<Leader>fc #(_G.MiniExtra.pickers.history { :scope ":"}) "Find command")
(map :n :<Leader>/ #(_G.MiniExtra.pickers.buf_lines { :scope :current }) "Find lines")
(map [:n :i] :<C-P> #(_G.MiniExtra.pickers.registers) "Find registers")

;; Visits (mini.visits)
(map :n :<Leader>v #(_G.MiniVisits.select_path nil { :filter :core}) "Select core (cwd)")
(map :n :<Leader>V #(_G.MiniVisits.select_path "" { :filter :core}) "Select core (all)")

(map :n :<Leader>la #(_G.MiniVisits.add_label :core) "Add to core")
(map :n :<Leader>ld #(_G.MiniVisits.remove_label :core) "Remove from core")

;; Insert blank lines
(map :n "[<Space>" "mzO<esc>`z" "Insert a line above cursor")
(map :n "]<Space>" "mzo<esc>`z" "Insert a line below cursor")

;; Terminal
(map :n :<Leader>tt vim.cmd.terminal "Open a terminal")
(map :n :<Leader>ts "<cmd>horizontal terminal<cr>" "Open a terminal in a split")

(map :t :<esc> "<C-\\><C-N>" "Leave terminal mode")
(map :t :<C-^> "<C-\\><C-N><C-O>" "Leave terminal mode and jump to last buffer")

;; Option toggling
(fn toggle [option]
  "Toggles the given neovim option"
  (tset vim.o option (not (. vim.o option))))

(map :n :|n #(toggle :number) "Toggle line number")
(map :n :|r #(toggle :relativenumber) "Toggle relative line number")

(map :n :|c #(toggle :cursorline) "Toggle cursorline")

(map :n :|l #(toggle :list) "Toggle list chararcters")
(map :n :|w #(toggle :wrap) "Toggle line wrapping")

(map :n :|s #(toggle :spell) "Toggle spell checking")

{: map : map-local : toggle}
