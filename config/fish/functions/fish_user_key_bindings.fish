# vim: syn=sh

function fish_user_key_bindings
    # Activate fzf default key bindings

    if not test -f ~/.config/fish/functions/fzf_key_bindings.fish
        # Where brew is installing packages
        set --local prefix (brew --prefix)
        cp $prefix/opt/fzf/shell/key-bindings.fish ~/.config/fish/functions/fzf_key_bindings.fish
    end

    fzf_key_bindings

    # Erase fzf defaults:
    # - for file search
    bind --erase \ct
    bind --erase --mode insert \ct
    # - for history search
    bind --erase \cr
    bind --erase --mode insert \cr

    # Add new bindings:
    # - ^H for history
    bind \ch fzf-history-widget
    bind --mode insert \ch fzf-history-widget

    # - ^K for fzf cd
    bind \ck fzf-cd-widget
    bind --mode insert \ck fzf-cd-widget

    # - ^F for fzf file search
    bind \cf fzf-file-widget
    bind --mode insert \cf fzf-file-widget

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
