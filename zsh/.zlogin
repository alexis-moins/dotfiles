# To track file sourcing in the terminal
echo '📖 Sourcing .zlogin'

# Execute code in the background
{
    # Compile the completion dump to increase startup speed
    if [[ -s "${_dumpfile}" && (! -s "${_dumpfile}.zwc" || "${_dumpfile}" -nt "${_dumpfile}.zwc") ]]; then
        zcompile "${_dumpfile}"
    fi

    # get rid of unnecessary variables
    unset _dumpfile
} &!
