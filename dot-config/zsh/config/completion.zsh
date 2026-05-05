# Author: Alexis Moins
# Creation: 18 juin 2020

# Prevent zsh from appending a symbol at the end of each completion item to
# differenciate its type i.e. '/' for directories, '*' for symlinks...
setopt NOLISTTYPES

# Place le curseur à la fin du mot lors
# d'une complétion acceptée
setopt ALWAYSTOEND

# Automatically insert the first element of the completion menu
setopt MENUCOMPLETE

# Lance le menu de complétion depuis la position du curseur, même s'il est à l'intérieur d'un mot
setopt COMPLETEINWORD

# Affiche un menu de séléction pour choisir avec quoi compléter
zstyle ':completion:*' menu select

# Complétion insensible aux majuscules / minuscules
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Display completion in grey, highlight the current match in white
zstyle ':completion:*:default' list-colors '=*=90' 'ma=0;32;40'

# Show when there are no mactches
zstyle ':completion:*:*:*:*:warnings' format '%F{1}-- no matches found --%f'

# Autorise seulement 2 erreurs pour la complétion approximative
zstyle ':completion:*:approximate:*' max-errors 2

zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# Utilise la completion approximative, une fois que la complétion normale a échouée
zstyle ':completion:*' completer _extensions _complete _approximate

# Complétion des chemins partiels
zstyle ':completion:*' list-suffixes

#
zstyle ':completion:*' expand prefix suffix

# Utilise le cache pour la complétion
zstyle ':completion:*' use-cache on

# Chemin vers le dossier de cache
zstyle ':completion:*' cache-path "${ZDATA}/cache"

autoload -Uz compinit

# Location of the completion dump file
COMPDUMP="${ZDATA}/cache/zcompdump"

# Initialize the completions system and check for cache once a day
if [[ -n "${COMPDUMP}"(#qN.mh+24) ]]; then
    # If .zcompdump is older than 24 hours, check for changes (-i)
    compinit -i -d "${COMPDUMP}"
    touch "${COMPDUMP}"
else
    # Otherwisem juste read the file (-d) without checking (-C)
    compinit -C -d "${COMPDUMP}"
fi
