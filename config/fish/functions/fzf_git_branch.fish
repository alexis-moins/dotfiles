function fzf_git_branch --description "Select a git branch interactively"

    set --local branch (git branch --format '%(refname:short)' | fzf)

    set --local current_position (commandline --cursor)
    set --local new_position (math $current_position + (string length $branch))

    commandline --current-token --append -- "$branch"
    commandline  --cursor $new_position
    commandline --function repaint

end
