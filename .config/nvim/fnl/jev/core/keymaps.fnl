(fn map [modes lhs rhs desc]
  "Creates a neovim mapping with the given description"
  (let [opts {:desc desc}]
    (vim.keymap.set modes lhs rhs opts)))

(map :i :jk :<C-C> "Leave insert mode")
(map :n :<Leader><BS> vim.cmd.nohlsearch "Clear search highlighting")

(map :n := vim.lsp.buf.format "Format file")
(map :n :<Leader>so vim.cmd.source "Source current file")

(map :n :<Leader>- vim.cmd.bdelete "Delete the current buffer")

(map [:n :v] :j :gj "Move down (respects wrap)")
(map [:n :v] :k :gk "Move up (respects wrap)")

;; Stay in place
(map :n :J "mzJ`z" "Join line below without moving cursor")

;; Easier line navigation
(map :n :L :$ "Go to the end of the line")

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

;; Sessions (via mini.sessions)
(map :n :<Leader>ss
     #(vim.ui.input {:prompt "Session name: "}
                    #(_G.MiniSessions.write $1)) "Write a session")

(map :n :<Leader>sl #(_G.MiniSessions.write :Session.vim) "Write a local session")

(map :n :<Leader>sr #(_G.MiniSessions.select :read) "Read a session")
(map :n :<Leader>sd #(_G.MiniSessions.select :delete) "Delete a session")

;; Insert blank lines
(map :n "[<Space>" "mzO<esc>`z" "Insert a line above cursor")
(map :n "]<Space>" "mzo<esc>`z" "Insert a line below cursor")

;; Terminal
(map :n :<Leader>tt vim.cmd.terminal "Open a terminal")
(map :n :<Leader>ts #(vim.cmd.horizontal :terminal ) "Open a terminal in a split")

;; Option toggling
(fn toggle [option]
  "Toggles the given neovim option"
  (tset vim.o option
        (not (. vim.o option))))

(map :n :|n #(toggle :number) "Toggle line number")
(map :n :|r #(toggle :relativenumber) "Toggle relative line number")

(map :n :|c #(toggle :cursorline) "Toggle cursorline")

(map :n :|l #(toggle :list) "Toggle list chararcters")
(map :n :|w #(toggle :wrap) "Toggle line wrapping")

(map :n :|s #(toggle :spell) "Toggle spell checking")

{ : map : toggle}
