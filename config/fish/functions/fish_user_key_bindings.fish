function fish_user_key_bindings
    # Bind ^H to history searching via fzf
    bind --mode insert \ch fzf-history

    # ^G for fzf cd
    bind --mode insert \cg fzf-git-branch

    # Bind ^B to find file with fzf
    bind --mode insert \cb fzf-find-file

    # Bind ^Z to resume background process
    bind --mode insert \cz fg\r

    # Bind ^R to restoring a tmux session
    bind --mode insert \cr tmux-restore

    function vi-normal-mode
        if commandline --paging-mode
            commandline -f cancel
        else
            set fish_bind_mode default
            commandline -f backward-char repaint-mode
        end
    end

    bind -M insert \cc vi-normal-mode

    bind -M insert \cy forward-char  # accepts suggestion
    bind -M insert \ck kill-line

    bind -M insert \cp up-or-search
    bind -M insert \cn down-or-search
end
