# vim: syntax=sh

function tmux-freeze --description 'Save a tmux session to a file in $HOME/.tmux-sessions'

    not test -d $HOME/.tmux-sessions && mkdir $HOME/.tmux-sessions

    not set --query TMUX && echo 'tmux-freeze: not inside a tmux session, nothing to freeze' && return 0

    set --query tmux_session_delimiter && set --local del $tmux_session_delimiter
    or set --local del ':'

    set --local format "#S$del#W$del#{pane_current_path}"
    set --local data (tmux list-windows -F $format)

    set --local name (string split --max 1 --fields 1 $del $data[1])

    string match -qr '^[0-9]+$' $name && set name default
    echo (string join \n $data) > $HOME/.tmux-sessions/$name

    set_color green
    echo "Session '$name' frozen!"
end
