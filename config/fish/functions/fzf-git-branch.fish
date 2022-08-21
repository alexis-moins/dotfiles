function fzf-git-branch --description "Select a git branch interactively"

    if not type -fq fzf
        echo 'fzf-git-branch: fzf is not install'
        return 1
    end

    set -l branch

    if set -q TMUX

        if not type -fq fzf-tmux
            echo 'fzf-git-branch: fzf-tmux is not install'
            return 1
        end


        set branch (git branch --format '%(refname:short)' | fzf-tmux $fzf_tmux_options $fzf_options)
    else
        set branch (git branch --format '%(refname:short)' | fzf $fzf_options)
    end

    test -z $branch && return 0

    set -l current_position (commandline --cursor)
    set -l new_position (math $current_position + (string length $branch))

    commandline --current-token --append -- "$branch"
    commandline  --cursor $new_position
    commandline -f repaint

end
