function t -a directory
    set -l match (zoxide query $directory)

    test -z $match && return 1

    set -l window (tmux list-windows -aF '#S|#{pane_current_path}' 2> /dev/null | rg -i $match)
    # window[1] -> session name
    # window[2] -> pane cwd

    set -l session_name (basename $match | string trim | string replace -ai '.' '')

    if test -z $TMUX
        # Outside of tmux
        test -z "$window"
        and tmux new-session -c $match -s $session_name
        and return
 
        or tmux attach -t (string split -f 1 '|' $window)
    else
        # Inside of tmux
        test -z "$window"
        and tmux new-session -c $match -d -s $session_name
        and tmux switch-client -t $session_name

        or tmux switch-client -t $session_name
    end
end
