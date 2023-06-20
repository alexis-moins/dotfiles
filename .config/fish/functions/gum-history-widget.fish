function gum-history-widget --description 'Widget to run commands from history'
    set -l COMMAND (history | gum filter --fuzzy --placeholder="Command to run...")

    test -z $COMMAND && return 0

    commandline --append $COMMAND
    commandline --function end-of-line
end
