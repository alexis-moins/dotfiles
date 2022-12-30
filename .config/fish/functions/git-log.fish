function git-log
    test -z $TMUX

    # Outside of tmux
    and git log $argv
    # Inside of tmux
    or tmux popup -E -w '75%' -h '75%' "git -c pager.log='less -+F' log --color $argv"
end
