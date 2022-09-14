function fzf-find-file --description 'Launch fzf to find files'

    if not type -fq fzf
        echo 'fzf-find-file: fzf is not install'
        return 1
    end

    set -l file

    if set -q TMUX

        if not type -fq fzf-tmux
            echo 'fzf-find-file: fzf-tmux is not install'
            return 1
        end

        set file (command $fzf_command | fzf-tmux $fzf_tmux_options $fzf_options)
    else
        set file (command $fzf_command | fzf $fzf_options)
    end

    test -z $file && return 0

    set -l current_position (commandline --cursor)
    set -l new_position (math $current_position + (string length $file))

    commandline --current-token --append -- $file
    commandline --cursor $new_position
    commandline --function repaint

end
