function git-branch --description 'Switch git branches interactively'
    set -l branch (git branch --sort='-committerdate' --format='%(refname:short)' \
        | gum filter --placeholder='Select branches' --no-limit | tr '\n' ' ')

    commandline -it -- $branch
end
