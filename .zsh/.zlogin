# Execute code in the background
{
    # Compile the completion dump to increase startup speed
    zcompdump="${ZDOTDIR}/.cache/zcompdump"
    if [[ -s "${zcompdump}" && (! -s "${zcompdump}.zwc" || "${zcompdump}" -nt "${zcompdump}.zwc") ]]; then
        zcompile "${zcompdump}"
    fi
} &!
