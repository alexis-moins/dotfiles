function git-branch --description 'Switch git branches interactively'
    set -l branch (git branch --sort='-committerdate' --format='%(refname:short)' \
        | gum filter --placeholder='Branch to switch to...')

    commandline -it -- $branch
end
