# vim: syntax=sh

function tmux-open --description 'Use fzf to create a new session from ~/projects'
    set --local directory (fd --type d . ~/projects | fzf-tmux $FZF_TMUX_OPTS)

    test -z $directory && return 1
    set --local name (string split --right --max 2 --fields 2 / $directory)

    tmux new-session -Ad -c $directory -s $name -n $name

    set --query TMUX
    and tmux switch-client -t $name
    or tmux attach -t $name
end
