# vim: syntax=sh

function tmux-open --description 'Use fzf to create a new session from ~/projects'
    set --local directory (fd --type d . ~/projects | fzf-tmux -p85%,70%)

    test -z $directory && return 1

    set --local name (string split --right --max 2 --fields 2 / $directory)

    set --query TMUX || tmux new-session -Ad -c $directory -s $name -n $name && return 0
    tmux new-session -A -c $directory -s $name -n $name
end
