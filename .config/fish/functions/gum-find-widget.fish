function gum-find-widget
    set -l CANDIDATES (fd --strip-cwd-prefix --hidden --follow | \
        gum filter --fuzzy --placeholder="Select elements" --no-limit | tr '\n' ' ')

    test -z $CANDIDATES && return 0
    commandline -it -- $CANDIDATES
end
