function tmux-switch --description 'Use fzf to switch to another open tmux session'
    set --local SESSION (tmux list-sessions -F '#S' | fzf-tmux $FZF_TMUX_OPTS)

    test -z $SESSION && return 0

    set --query TMUX
        and tmux switch-client -t $SESSION
        or tmux attach -t $SESSION
end
