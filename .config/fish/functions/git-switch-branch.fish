function git-switch-branch
    git branch --sort="-committerdate" --format="%(refname:short)" \
        | fzf-tmux -p $FZF_TMUX_OPTS | xargs git switch
end
