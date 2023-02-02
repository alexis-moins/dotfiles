function tmux-switch --description 'Use fzf to switch to another open tmux session'
    set --local window (tmux list-sessions -F '#S: #{session_windows}' | fzf-tmux $FZF_TMUX_OPTS)

    test -z $window && return 0
    set --local parts (string split ': ' $window)

    set --query TMUX
        and tmux switch-client -t $parts[1]
        and tmux select-window -t $parts[2]
        or tmux attach -t $parts[1]:$window_name
end
