# Execute code in the background
{
    # Compile the completion dump to increase startup speed
    zcompdump=".cache/zcompdump"
    if [[ -s "${zcompdump}" && (! -s "${zcompdump}.zwc" || "${zcompdump}" -nt "${zcompdump}.zwc") ]]; then
        zcompile "${zcompdump}"
    fi
} &!
