# vim: syntax=sh

function tmux-open --description 'Use fzf to create a new session from ~/projects'
    set --local directories ~/code ~/.dotfiles
    set --local directory (string replace $HOME/ '' (fd --type d . $directories) | fzf-tmux $FZF_TMUX_OPTS)

    test -z $directory && return 0
    set --local name (string split --right --max 2 --fields 2 / $directory)

    tmux new-session -Ad -c $directory -s $name -n $name

    set --query TMUX
    and tmux switch-client -t $name
    or tmux attach -t $name
end
