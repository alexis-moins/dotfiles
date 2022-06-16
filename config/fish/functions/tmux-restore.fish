# vim: syntax=sh

function tmux-restore --description 'Restore a tmux session saved using tmux-freeze'

    not test -d $HOME/.tmux-sessions
        and set_color red
        and echo tmux-restore: No sessions to restore
        and return 0

    # Select a session
    set --local file (fd --type f . $HOME/.tmux-sessions | fzf-tmux $FZF_TMUX_OPTS)

    test -z $file && return 0
    set --local windows (cat $file | string split ' ')

    # Use the user-defined delimiter if it is set, otherwise use :
    set --query tmux_session_delimiter || set --local tmux_session_delimiter ':'

    set --local session_name (string split $tmux_session_delimiter windows[1])[3]
    tmux has-session -t $session_name 2> /dev/null
        and set --query TMUX
        and tmux switch-client -t $session_name
        and return 0

    or tmux attach-session -t $session_name
    and return 0

    tmux start-server

    for window in $windows

        set --local parts (string split $tmux_session_delimiter $window)

        tmux has-session -t $session_name 2> /dev/null
            and tmux new-window -d -t $parts[1] -n $parts[2] -c $parts[3]
            and continue
            or tmux new-session -d -s $parts[1] -n $parts[2] -c $parts[3]

    end

    set --query TMUX && tmux switch-client -t $parts[1] || tmux attach
end
