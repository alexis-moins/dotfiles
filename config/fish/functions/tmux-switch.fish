# vim: syntax=sh

function tmux-switch --description 'Use fzf to switch to another open tmux session'
    # TODO check if tmux is running
    set --local window (tmux list-windows -a -F '#S: #{window_index}|#W' | fzf-tmux -p85%,70%)

    test -z $window && return 0
    set --local parts (string split ': ' $window)
    set --local window_name (string split --fields 2 '|' $parts[2])

    set --query TMUX
        and tmux switch-client -t $parts[1]
        and tmux select-window -t $window_name
        or tmux attach -t $parts[1]:$window_name
end
