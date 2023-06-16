function git-switch-branch --description="Switch git branches interactively"
    git branch --sort='-committerdate' --format='%(refname:short)' \
        | gum filter --placeholder='Branch to switch to...' | xargs git switch
end
