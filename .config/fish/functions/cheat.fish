function cheat --description 'cheat sheets using cht.sh'
    # Options for a better spin look
    set SPIN_OPTS --title 'Loading...' --spinner 'minidot' --spinner.foreground '2' --show-output

    set namespaces (gum spin $SPIN_OPTS -- curl 'cht.sh/:list')

    set namespace (echo $namespaces | tr ' ' '\n' | gum filter)
    test -z $namespace && return 1

    set query (gum input --placeholder 'your query' | tr ' ' '+')
    test -z $query && return 1

    gum spin $SPIN_OPTS -- curl -s "cht.sh/$namespace/$query?style=monokai" | bat --plain
end
