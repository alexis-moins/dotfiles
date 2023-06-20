function tmux-switch --description 'Use gum to switch / attach to a tmux session'
    set -l SESSION (tmux list-sessions -F '#S' | gum filter --placeholder "Select a session...")
    test -z $SESSION && return 0

    set --query TMUX && tmux switch-client -t $SESSION || tmux attach-session -t $SESSION
end
