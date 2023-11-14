function git-switch-branch
    git switch (git branch --sort='-committerdate' --format='%(refname:short)' | gum filter --placeholder='Select a branch')
end
