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

    bind -M insert \cy forward-char  # accepts suggestion
    bind -M insert \ck kill-line

    bind -M insert \cp up-or-search
    bind -M insert \cn down-or-search

    # Bind ^z to resume background process
    bind -M insert \cz fg\r

    # Bind ^b to git switch branch
    bind -M insert \cb git-switch-branch

    # Bind ^f to gum file widget
    bind -M insert \cf gum-file-widget

    # Bind ^g to gum find widget
    bind -M insert \cg gum-find-widget

    # Bind ^e to gum cd widget
    bind -M insert \ce gum-cd-widget
end

