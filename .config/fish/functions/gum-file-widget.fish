function gum-file-widget
    set -l CANDIDATES (fd --strip-cwd-prefix --hidden --follow --type='f' | gum filter --fuzzy --placeholder="Select a file...")

    test -z $CANDIDATES && return 0

    commandline -it -- $CANDIDATES
end
