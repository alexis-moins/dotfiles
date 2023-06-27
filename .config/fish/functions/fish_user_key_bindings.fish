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

    # Bind ^e to git branch
    bind -M insert \ce git-branch

    # Bind ^b to gum find widget
    bind -M insert \cb gum-find-widget

    # Bind ^f to gum cd widget
    bind -M insert \cf gum-cd-widget
end

