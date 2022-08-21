function fish_user_key_bindings

    # Bind ^H to history searching via fzf
    bind \ch fzf-history
    bind --mode insert \ch fzf-history

    # ^G for fzf cd
    bind \cg fzf-git-branch
    bind --mode insert \cg fzf-git-branch

    # Bind ^B to find file with fzf
    bind \cb fzf-find-file
    bind --mode insert \cb fzf-find-file

    # Bind ^Z to resume background process
    bind \cz fg\r
    bind --mode insert \cz fg\r

    # Bind ^R to restoring a tmux session
    bind \cr tmux-restore
    bind --mode insert \cr tmux-restore

    # Bind ^Y to accept suggestion
    bind \cy forward-char
    bind --mode insert \cy forward-char

end
