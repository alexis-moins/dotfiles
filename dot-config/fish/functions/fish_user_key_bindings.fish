function fish_user_key_bindings
    function vi-normal-mode
        if commandline --paging-mode
            commandline -f cancel
        else
            set fish_bind_mode default
            commandline -f backward-char repaint-mode
        end
    end

    bind -M insert jk vi-normal-mode

    # Bind <Tab> to 'accept-suggestion'
    bind -M insert ctrl-h accept-autosuggestion
    #
    # bind -M insert \t accept-autosuggestion

    bind -M insert ctrl-k kill-line

    bind -M insert ctrl-p up-or-search
    bind -M insert ctrl-n down-or-search

    # Bind ^z to resume background process
    bind -M insert ctrl-z fg\r
end

