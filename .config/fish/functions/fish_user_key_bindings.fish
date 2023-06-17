function fish_user_key_bindings
    # ^B -> find file
    # ^H -> history
    # ^f -> directory
    fzf_key_bindings

    bind --mode insert \ce git-switch-branch

    # Bind ^Z to resume background process
    bind --mode insert \cz fg\r

    # Bind ^R to restoring a tmux session
    # bind --mode insert \cr tmux-restore

    function vi-normal-mode
        if commandline --paging-mode
            commandline -f cancel
        else
            set fish_bind_mode default
            commandline -f backward-char repaint-mode
        end
    end

    bind -M insert jk vi-normal-mode

    bind -M insert \cy forward-char  # accepts suggestion
    bind -M insert \ck kill-line

    bind -M insert \cp up-or-search
    bind -M insert \cn down-or-search

    bind -M insert \cb gum-file-widget
end

