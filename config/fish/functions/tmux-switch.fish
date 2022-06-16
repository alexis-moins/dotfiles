# vim: syntax=sh

function tmux-switch --description 'Use fzf to switch to another open tmux session'
    set --local session (tmux list-sessions -F '#S: #{session_windows} window(s)' | fzf-tmux -p85%,70%)

    test -z $session && return 0
    set session (string split --fields 1 : $session)

    set --query TMUX && tmux switch-client -t $session || tmux attach -t $session
end
