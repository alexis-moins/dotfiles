function cheat
    set -l namespace (curl -s cht.sh/:list | gum filter)
    set -l query (gum input --placeholder 'query' | tr ' ' '+')

    gum spin --title 'Loading...' --spinner 'minidot' --spinner.foreground '2' --show-output -- curl "cht.sh/$namespace/$query?style=monokai" | bat
end
