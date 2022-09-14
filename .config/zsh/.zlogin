# Execute code in the background
{
    # Compile the completion dump to increase startup speed
    if [[ -s "${COMPDUMP}" && (! -s "${COMPDUMP}.zwc" || "${COMPDUMP}" -nt "${COMPDUMP}.zwc") ]]; then
        zcompile "${COMPDUMP}"
    fi
} &!

# get rid of unnecessary variables
unset COMPDUMP BREW ZDATA
