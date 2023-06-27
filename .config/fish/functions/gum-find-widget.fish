function gum-find-widget
    set -l CANDIDATES (fd --strip-cwd-prefix --hidden --follow | gum filter --fuzzy --placeholder="Select a file...")

    test -z $CANDIDATES && return 0

    commandline -it -- $CANDIDATES
end
