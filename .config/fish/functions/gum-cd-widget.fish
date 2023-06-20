function gum-cd-widget
    set -l CANDIDATES (fd --strip-cwd-prefix --hidden --follow --type d)
    test -z "$CANDIDATES" && return 0

    set -l directory (echo $CANDIDATES | string split " " | gum filter --placeholder="Select a directory...")
    test -z $directory && return 0

    cd $directory
    commandline --function repaint
end
