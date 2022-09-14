function fzf-history --description 'Launch fzf to view history'

    if not type -fq fzf
        echo 'fzf-history: fzf is not install'
        return 1
    end

    set -l cmd

    if set -q TMUX

        if not type -fq fzf-tmux
            echo 'fzf-history: fzf-tmux is not install'
            return 1
        end

        set cmd (history | fzf-tmux $fzf_tmux_options $fzf_options)
    else
        set cmd (history | fzf $fzf_options)
    end

    test -z $cmd && return 0

    set -l current_position (commandline --cursor)
    set -l new_position (math $current_position + (string length $cmd))

    commandline --current-token --append -- $cmd
    commandline --cursor $new_position
    commandline --function repaint

end

